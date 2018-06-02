module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (..)
import UrlParser exposing (..)
import Html.Attributes exposing (class, href)


-- function responsible for routing through the views of the app.

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map HomeRoute (s "home")
        , map ChatRoute (s "chat")
        ]




parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of

        Just route ->  route

        Nothing -> NotFoundRoute




homePath : String
homePath =
    "#/home"


chatPath : String
chatPath =
    "#/chat"

