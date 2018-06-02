module Main exposing (..)


import Models exposing (Model, initialModel)
import Msgs exposing (..)
import Navigation exposing (Location)
import Routing
import Update exposing (update)
import View exposing (view)
import List
import WebSocket



-- this is initial function which starts when we conntect to the server.

init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, Cmd.none )



-- function for special tasks, for example watching mouse movement

subscriptions : Model -> Sub Msg
subscriptions model =
    WebSocket.listen "ws://localhost:8080/websocket" NewChatMessage




main : Program Never Model Msg
main =
    Navigation.program Msgs.OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
