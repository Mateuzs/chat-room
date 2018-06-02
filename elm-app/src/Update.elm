module Update exposing (..)

import Msgs exposing (..)
import Models exposing (Model)
import Routing exposing (parseLocation)
import Commands exposing (..)
import RemoteData
import Random
import WebSocket
import Task
import Dom.Scroll exposing (..)



-- function that uptades information inside models


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of


        Msgs.OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

       
        PostChatMessage ->
            let
                message = model.userName ++ "#$:$#" ++ model.userMessage
            in
            { model | userMessage = "" } ! [WebSocket.send "ws://localhost:8080/websocket" message]

        UpdateUserMessage message ->
            { model | userMessage = message } ! []

        UpdateUserName name ->
            { model | userName = name } ! []

        KeyDown key ->
            if key == 13 then
                    update PostChatMessage model           
            else
                 model ! []

        NewChatMessage message  ->
             
             
             let
                 
                 messageClone = message

                 userName = 
                    message
                        |> String.split "\""
                        |> List.take 4
                        |> List.drop 3
                        |> String.concat

                 userMessage = 
                    messageClone
                        |> String.split "\""
                        |> List.take 8
                        |> List.drop 7
                        |> String.concat
        
             in
               ( {model | chatMessages = model.chatMessages ++ [userName ++ " : " ++ userMessage] }  
               , Task.attempt (always NoOp) <| toBottom "ul") 
            
        NoOp ->
            model ! []


filter_data : String -> Bool
filter_data element =
    element /= "{\"sender\"" && element /= ",\"msg\""

