module Util.Url exposing (..)

import Maybe.Extra as Maybe
import Url exposing (Url)
import Url.Parser
import Url.Parser.Query as Query


getQQuery : Url -> String
getQQuery url =
    { url | path = "" }
        |> Url.Parser.parse (Url.Parser.query (Query.string "q"))
        |> Maybe.join
        |> Maybe.withDefault ""


toStringWithQQuery : Url -> String -> String
toStringWithQQuery url query =
    { url | query = Just ("q=" ++ Url.percentEncode query) }
        |> Url.toString
