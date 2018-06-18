module Views.Chat exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msgs exposing (..)
import Routing exposing (homePath)
import Models exposing (..)
import Task
import Dom.Scroll exposing (..)
import Json.Decode as Json







--- generates view of the page : two main parts navBar and body

view : Model -> Html Msg
view model  =
    div []
        [ nav,
          body model
        ]




-- subunctions supporting the view function

nav :  Html Msg
nav  =
    div [ class "navBar" ]
        [div [class "navBarFont"]
             [homeBtn]
        ]



body : Model -> Html Msg
body model =
    div [class "imageChat"]
    [ 
     all_posts model,
     data_input model
    ] 
  


data_input : Model -> Html Msg
data_input model = 
    div [class "inputChatBlock"]
    [
      username_input model,
      message_input model,
      sendBtn
    ]

username_input : Model -> Html Msg
username_input model = 
     
     div [class "inputText"] [
        
          text  "Your name: "
          ,
          input [ 
              class "inputField"
            , placeholder "name..."
            , autofocus True
            , value model.userName
            , onInput UpdateUserName
            ] []
    ] 


message_input : Model -> Html Msg
message_input model =
    
    div [class "inputText"]
    [ 
      text "Your message: ",
      input [ 
              class "inputField"
            , onKeyDown KeyDown
            , placeholder "message..."
            , autofocus True
            , value model.userMessage
            , onInput UpdateUserMessage
            ] []
  ] 

onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
  on "keydown" (Json.map tagger keyCode)


all_posts : Model -> Html Msg
all_posts model =
    div [class "chatBlock"]
        [ ul
            [ class "liststyles"
            , id "ul"
            ]
          <|
            List.map one_message model.chatMessages   
        ]


one_message : String -> Html msg
one_message message =
    li [class "textChatBlock"] [ text message ]



displayChatMessages : List String -> Html a
displayChatMessages chatMessages =
    div [class "textChatBlock"]
     (List.map ( \x -> div [] [ text x ] ) chatMessages)



sendBtn : Html Msg
sendBtn = 
    button [class "sendBtn", onClick PostChatMessage ] 
    
    [
       text "Send"
    ]


--button functions on the view,

-- home button in the navbar

homeBtn : Html.Html Msg
homeBtn =
  let
    path = homePath
  in
      a
            [ class "navBarBtn btn regular"
            , href path
            ]
            [ i [ class "fa fa-home" ] [], text "Home" ]