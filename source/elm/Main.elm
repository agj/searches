module Main exposing (main, parseUrlQuery)

import Browser
import Browser.Navigation as Navigation
import Element exposing (Color, Element, column, fill, height, padding, paddingXY, px, spacing, width, wrappedRow)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input exposing (button, focusedOnLoad, labelHidden, multiline, placeholder)
import Levers
import Maybe.Extra as Maybe
import Palette
import Search exposing (Search)
import Searches
import Url exposing (Url)
import Url.Parser
import Url.Parser.Query as Query



-- MAIN


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = always NoOp
        , onUrlRequest = always NoOp
        }



-- MODEL


type alias Model =
    { query : String
    , navigationKey : Navigation.Key
    , currentUrl : Url
    }



-- INIT


type alias Flags =
    {}


init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url navKey =
    ( { query = parseUrlQuery url
      , navigationKey = navKey
      , currentUrl = url
      }
    , Cmd.none
    )


parseUrlQuery : Url -> String
parseUrlQuery url =
    url
        |> Url.Parser.parse (Url.Parser.query (Query.string "q"))
        |> Maybe.join
        |> Maybe.withDefault ""



-- UPDATE


type Msg
    = EnteredText String
    | PressedButton Search
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EnteredText newText ->
            ( { model | query = newText }
            , Navigation.replaceUrl model.navigationKey (queryToUrl model.currentUrl newText)
            )

        PressedButton search ->
            ( model
            , navigate model.navigationKey model.currentUrl model.query search
            )

        NoOp ->
            ( model, Cmd.none )


navigate : Navigation.Key -> Url -> String -> Search -> Cmd Msg
navigate navKey curUrl query search =
    if Levers.disableSearch == False then
        Navigation.load (Search.toUrl query search.url)

    else
        Cmd.none


queryToUrl : Url -> String -> String
queryToUrl curUrl query =
    { curUrl | query = Just ("q=" ++ Url.percentEncode query) }
        |> Url.toString



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Searches"
    , body =
        [ Element.layout
            [ Background.color Palette.dark
            , Font.size 16
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
        , Border.color Palette.lightish
        , paddingXY 0 10
        , Font.size 21
        , focusedOnLoad
        , Element.focused
            [ Border.color Palette.highlight
            ]
        ]
        { text = text
        , onChange = EnteredText
        , label = labelHidden "輸入你的検索關鍵詞"
        , placeholder =
            Just
                (placeholder [ Font.color Palette.lightish ]
                    (Element.text "検索内容")
                )
        , spellcheck = False
        }


viewButtons : Element Msg
viewButtons =
    wrappedRow [ spacing 10 ]
        ([ List.map (viewButton Palette.dark1) Searches.searches.regular
         , List.map (viewButton Palette.dark2) Searches.searches.dictionaries
         , List.map (viewButton Palette.dark3) Searches.searches.images
         , List.map (viewButton Palette.dark1) Searches.searches.wikipedia
         , List.map (viewButton Palette.dark2) Searches.searches.other
         ]
            |> List.concat
        )


viewButton : Color -> Search -> Element Msg
viewButton color search =
    button
        [ Background.color color
        , paddingXY 10 10
        , height (px 50)
        , width fill
        , Font.center
        , Border.rounded 5
        , Element.focused
            [ Background.color Palette.highlight
            , Font.color Palette.dark
            ]
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
