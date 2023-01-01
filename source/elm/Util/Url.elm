module Util.Url exposing (..)

import Maybe.Extra as Maybe
import Url exposing (Url)
import Url.Parser
import Url.Parser.Query as Query


parseUrlQuery : Url -> String
parseUrlQuery url =
    url
        |> Url.Parser.parse (Url.Parser.query (Query.string "q"))
        |> Maybe.join
        |> Maybe.withDefault ""


queryToUrl : Url -> String -> String
queryToUrl curUrl query =
    { curUrl | query = Just ("q=" ++ Url.percentEncode query) }
        |> Url.toString
