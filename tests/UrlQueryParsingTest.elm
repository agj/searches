module UrlQueryParsingTest exposing (..)

import Expect
import Main
import Test exposing (..)
import Url exposing (Url)


parseUrlQuery =
    describe "parseUrlQuery"
        [ test "Parse from local URL" <|
            \_ ->
                "http://localhost:1234/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Main.parseUrlQuery
                    |> Expect.equal (Just "myQuery")
        , test "Parse from local URL with path" <|
            \_ ->
                "http://localhost:1234/searches/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Main.parseUrlQuery
                    |> Expect.equal (Just "myQuery")
        , test "Parse from Github Pages URL" <|
            \_ ->
                "https://agj.github.io/searches/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Main.parseUrlQuery
                    |> Expect.equal (Just "myQuery")
        ]
