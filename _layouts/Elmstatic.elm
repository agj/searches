module Elmstatic exposing
    ( Content
    , Layout
    , Page
    , htmlTemplate
    , layout
    )

import Browser
import Element exposing (Element)
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Decode as Json


type alias Page msg =
    { content : Element msg
    , title : String
    }


type alias Content a =
    { a | siteTitle : String, title : String }


type alias Layout =
    Program Json.Value Json.Value Never


htmlTemplate : String -> List (Html Never) -> Html Never
htmlTemplate title contentNodes =
    node "html"
        []
        [ node "head"
            []
            [ node "title" [] [ text title ]
            , node "meta" [ attribute "charset" "utf-8" ] []
            ]
        , node "body" [] contentNodes
        ]


layout : Json.Decoder (Content content) -> (Content content -> Result String (List (Html Never))) -> Layout
layout decoder view =
    Browser.document
        { init = \contentJson -> ( contentJson, Cmd.none )
        , view =
            \contentJson ->
                case Json.decodeValue decoder contentJson of
                    Err error ->
                        { title = "error"
                        , body = [ Html.div [ attribute "error" <| Json.errorToString error ] [] ]
                        }

                    Ok content ->
                        case view content of
                            Err viewError ->
                                { title = "error"
                                , body = [ Html.div [ attribute "error" viewError ] [] ]
                                }

                            Ok viewHtml ->
                                { title = ""
                                , body = [ htmlTemplate content.siteTitle <| viewHtml ]
                                }
        , update = \msg contentJson -> ( contentJson, Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
