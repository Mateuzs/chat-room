
module Views.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,href)
import Msgs exposing (Msg)
import Routing exposing (..)






--- generates view of the page : two main parts navBar and body

view : Html Msg
view   =
    div []
        [ nav,
          body
        ]




-- subunctions supporting the view function

nav :  Html Msg
nav  =
    div [ class "navBar" ]
        [div [class "navBarFont"]
             [famousPeopleBtn]
        ]



body : Html Msg
body =
    div  [class "imageIntro"]
    [div [class "homeBlock"]
         [ div [class "textHomeBlock"] [text ("Hey, Stranger!"
         ++ "\nHolster your six-shooters and strap on your spurs for a Wild West action adventure!"
         )
         ]]]





--button functions on the view,

famousPeopleBtn : Html Msg
famousPeopleBtn =
   let 
        path = chatPath
   in
    
    a
        [ class "btn navBarBtn regular"
        , href path
        ]
        [ i [ class "fa fa-chevron-right mr1" ] [], text "Let's chat!" ]






