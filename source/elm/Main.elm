module Main exposing (main)

import Browser
import Element exposing (Element, column, fill, padding, width)
import Element.Background as Background
import Element.Font as Font
import Element.Input exposing (labelHidden, multiline, placeholder)
import Palette



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
    {}



-- INIT


type alias Flags =
    {}


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( {}
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        ignore =
            ( model, Cmd.none )
    in
    case msg of
        NoOp ->
            ignore



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Searches"
    , body =
        [ Element.layout
            [ Background.color Palette.dark
            ]
            viewMain
        ]
    }


viewMain : Element Msg
viewMain =
    column
        [ Font.color Palette.light
        , width fill
        , padding 10
        ]
        [ viewInput "text"
        ]


viewInput : String -> Element Msg
viewInput text =
    multiline
        [ width fill
        , Font.color Palette.dark
        ]
        { text = text
        , onChange = always NoOp
        , label = labelHidden "Text to search"
        , placeholder = Just (placeholder [] (Element.text "Enter your text"))
        , spellcheck = False
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
