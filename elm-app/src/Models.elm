module Models exposing (..)





-- this is initial model which is loaded when we connect to the server

initialModel : Route -> Model
initialModel route =
    { 
    route = route,
    chatMessages = [],
    userName = "",
    userMessage = ""
    }
    




-- famousPeople Models


type alias Model =
       { 
         route : Route,
         chatMessages : List String,
         userName: String,
         userMessage : String
       }



-- Routing Models


type Route
    = HomeRoute
    | ChatRoute
    | NotFoundRoute




