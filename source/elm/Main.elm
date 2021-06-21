module Main exposing (main)

import Browser
import Browser.Navigation as Navigation
import Element exposing (Element, column, fill, height, maximum, minimum, padding, paddingXY, px, shrink, spacing, width, wrappedRow)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input exposing (button, labelHidden, multiline, placeholder)
import Levers
import Palette
import Search exposing (QueryUrl, Search)
import Searches



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
    | PressedButton Search


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EnteredText newText ->
            ( { model | query = newText }
            , Cmd.none
            )

        PressedButton search ->
            ( model
            , if Levers.disableSearch == False then
                Navigation.load (Search.toUrl model.query search.url)

              else
                Cmd.none
            )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Searches"
    , body =
        [ Element.layout
            [ Background.color Palette.dark
            , Font.size 18
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
        , spacing 20
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
        , Border.color
            Palette.light
        , paddingXY 0 10
        , Element.focused
            [ Border.color Palette.highlight
            ]
        ]
        { text = text
        , onChange = EnteredText
        , label = labelHidden "輸入你的検索關鍵詞"
        , placeholder = Just (placeholder [] (Element.text "検索内容"))
        , spellcheck = False
        }


viewButtons : Element Msg
viewButtons =
    wrappedRow [ spacing 10 ]
        (List.map viewButton Searches.searches)


viewButton : Search -> Element Msg
viewButton search =
    button
        [ Background.color Palette.gray
        , paddingXY 10 10
        , height (px 50)
        , width fill
        , Font.center
        , Border.rounded 5
        , Element.focused [ Background.color Palette.highlight ]
        ]
        { onPress = Just (PressedButton search)
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
