module Util.UrlTest exposing (..)

import Expect
import Test exposing (..)
import Url exposing (Url)
import Util.Url


getQQuery =
    describe "getQQuery"
        [ test "From local URL" <|
            \_ ->
                "http://localhost:1234/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Util.Url.getQQuery
                    |> Expect.equal (Just "myQuery")
        , test "From local URL with path" <|
            \_ ->
                "http://localhost:1234/searches/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Util.Url.getQQuery
                    |> Expect.equal (Just "myQuery")
        , test "From Github Pages URL" <|
            \_ ->
                "https://agj.github.io/searches/?q=myQuery"
                    |> Url.fromString
                    |> Maybe.map Util.Url.getQQuery
                    |> Expect.equal (Just "myQuery")
        ]
