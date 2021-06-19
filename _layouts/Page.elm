module Page exposing (footer, header, layout, main, markdown)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes as Attr exposing (alt, attribute, class, href, src)
import Markdown
import Styles


header : List (Html Never)
header =
    [ div [ class "header-logo" ]
        [ img [ alt "Author's blog", src "/img/logo.png", attribute "width" "100" ]
            []
        ]
    , div [ class "navigation" ]
        [ ul []
            [ li []
                [ a [ href "/posts" ]
                    [ text "Posts" ]
                ]
            , li []
                [ a [ href "/about" ]
                    [ text "About" ]
                ]
            , li []
                [ a [ href "/contact" ]
                    [ text "Contact" ]
                ]
            ]
        ]
    ]


footer : Html Never
footer =
    div [ class "footer" ]
        [ img
            [ alt "Author's blog"
            , src "/img/logo.png"
            , attribute "style" "float: left; padding-top: 7px"
            , attribute "width" "75"
            ]
            []
        , div [ class "link" ]
            [ githubIcon
            , a [ href "https://github.com" ]
                [ text "Author's GitHub" ]
            ]
        , div [ class "link" ]
            [ twitterIcon
            , a [ href "https://twitter.com" ]
                [ text "Author's Twitter" ]
            ]
        , div [ class "link" ]
            [ a [ href "https://www.npmjs.com/package/elmstatic" ]
                [ text "Created with Elmstatic" ]
            ]
        ]


layout : String -> List (Html Never) -> List (Html Never)
layout title contentItems =
    header
        ++ [ div [ class "sidebar" ]
                []
           , div [ class "sidebar2" ]
                []
           , div [ class "content" ]
                ([ h1 [] [ text title ] ] ++ contentItems)
           , footer
           , Elmstatic.stylesheet "/styles.css"
           , Styles.styles
           ]


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePage <|
        \content ->
            Ok <| layout content.title [ markdown content.content ]
