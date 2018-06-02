module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model)
import Views.Home
import Views.Chat





-- main view function, generates view of the webpage

view : Model -> Html Msg
view model =
    div []
        [ page model ]


-- function checks which view is supposed to be shown.

page : Model -> Html Msg
page model =
    case model.route of
    
        Models.HomeRoute ->
            Views.Home.view
        
        Models.ChatRoute ->
            Views.Chat.view model

        Models.NotFoundRoute ->
            notFoundView



notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
