module Index exposing
    ( htmlToReinjectInBody
    , htmlToReinjectInHead
    , index
    )

import Html.String exposing (..)
import Html.String.Attributes exposing (..)
import Html.String.Extra exposing (..)
import Main
import Starter.FileNames
import Starter.Flags
import Starter.Icon
import Starter.SnippetHtml
import Starter.SnippetJavascript


index : Starter.Flags.Flags -> Html msg
index flags =
    let
        relative =
            Starter.Flags.toRelative flags

        fileNames =
            Starter.FileNames.fileNames flags.version flags.commit
    in
    html
        [ lang "zh" ]
        [ head []
            ([]
                ++ [ meta [ charset "utf-8" ] []
                   , title_ [] [ text flags.nameLong ]
                   , meta [ name "author", content flags.author ] []
                   , meta [ name "description", content flags.description ] []
                   , meta [ name "viewport", content "width=device-width, initial-scale=1, shrink-to-fit=no" ] []
                   ]
            )
        , body []
            ([]
                -- The DOM node that Elm will take over
                ++ [ div [ id "elm" ] [] ]
                -- Loading Elm code
                ++ [ script [ src (relative ++ fileNames.outputCompiledJsProd) ] [] ]
                -- Loading utility for pretty console formatting
                ++ Starter.SnippetHtml.prettyConsoleFormatting relative flags.env
                -- Initializing "window.ElmStarter"
                ++ [ script [] [ textUnescaped <| Starter.SnippetJavascript.metaInfo flags ] ]
                -- Let's start Elm!
                ++ [ Html.String.Extra.script []
                        [ Html.String.textUnescaped
                            ("""
                            var node = document.getElementById('elm');
                            window.ElmApp = Elm.Main.init(
                                { node: node
                                , flags:
                                    { starter : """
                                ++ Starter.SnippetJavascript.metaInfoData flags
                                ++ """ 
                                    }
                                }
                            );"""
                                ++ Starter.SnippetJavascript.portChangeMeta
                            )
                        ]
                   ]
            )
        ]


htmlToReinjectInHead : a -> List b
htmlToReinjectInHead _ =
    []


htmlToReinjectInBody : a -> List b
htmlToReinjectInBody _ =
    []
