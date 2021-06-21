module Main exposing (main)

import Browser
import Element exposing (Element, column, fill, focused, padding, paddingXY, spacing, width, wrappedRow)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onFocus, onLoseFocus)
import Element.Font as Font
import Element.Input exposing (button, labelHidden, multiline, placeholder)
import Palette
import Searches exposing (Search)



-- MAIN


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { query : String
    }



-- INIT


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { query = ""
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = EnteredText String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        ignore =
            ( model, Cmd.none )
    in
    case msg of
        EnteredText newText ->
            ( { model | query = newText }
            , Cmd.none
            )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Searches"
    , body =
        [ Element.layout
            [ Background.color Palette.dark
            ]
            (viewMain model.query)
        ]
    }


viewMain : String -> Element Msg
viewMain query =
    column
        [ Font.color Palette.light
        , width fill
        , padding 10
        , spacing 10
        ]
        [ viewInput query
        , viewButtons
        ]


viewInput : String -> Element Msg
viewInput text =
    multiline
        [ width fill
        , Background.color Palette.clear
        , Border.widthEach { sides | bottom = 2 }
        , Border.rounded 0
        , Element.focused
            [ Border.color Palette.highlight
            ]
        , Border.color
            Palette.light
        , paddingXY 0 10
        ]
        { text = text
        , onChange = EnteredText
        , label = labelHidden "輸入你的検索關鍵詞"
        , placeholder = Just (placeholder [] (Element.text "検索内容"))
        , spellcheck = False
        }


viewButtons : Element Msg
viewButtons =
    wrappedRow [ spacing 5 ]
        (List.map viewButton Searches.searches)


viewButton : Search -> Element Msg
viewButton search =
    button
        [ Background.color Palette.gray
        , paddingXY 5 5
        ]
        { onPress = Nothing
        , label = Element.text search.name
        }



-- VIEW UTILS


sides :
    { left : Int
    , right : Int
    , top : Int
    , bottom : Int
    }
sides =
    { left = 0
    , right = 0
    , top = 0
    , bottom = 0
    }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
