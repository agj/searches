module Page exposing (layout, main)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)
import Styles


layout : String -> List (Html Never) -> List (Html Never)
layout title contentItems =
    [ div [ class "content" ]
        ([ h1 [] [ text title ] ] ++ contentItems)
    , Styles.styles
    ]


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePage <|
        \content ->
            Ok <| layout content.title content.content
