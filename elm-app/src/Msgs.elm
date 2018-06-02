
module Msgs exposing (..)

import Navigation exposing (Location)
import Mouse exposing (Position)



-- special type for variety of messages used in the app

type Msg
    = OnLocationChange Location
    | PostChatMessage
    | UpdateUserMessage String
    | UpdateUserName String
    | NewChatMessage String
    | KeyDown Int
    | NoOp

   
   


