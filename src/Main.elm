port module Main exposing (conf, main)

import Browser
import Browser.Events
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Html
import Html.Attributes
import Html.Events
import Json.Decode
import Starter.ConfMain
import Starter.Flags


conf : Starter.ConfMain.Conf
conf =
    { urls = []
    , assetsToCache = []
    }



-- MAIN


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


internalConf : { urlLabel : String }
internalConf =
    { urlLabel = "tangram" }



-- MODEL


type alias Model =
    { flags : Flags }



-- FLAGS


type alias Flags =
    { starter : Starter.Flags.Flags
    }



-- INIT


init : Flags -> ( Model, Cmd msg )
init flags =
    ( { flags = flags }
    , updateHtmlMeta flags.starter
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        []



-- MESSAGES


type Msg
    = LinkClicked String



-- UPDATE


updateHtmlMeta : Starter.Flags.Flags -> Cmd msg
updateHtmlMeta starterFlags =
    Cmd.batch
        [ changeMeta
            { type_ = "property"
            , querySelector = "title"
            , fieldName = "innerHTML"
            , content = starterFlags.nameLong
            }
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html.Html Msg
view model =
    Html.text "Hello World!"



-- PORTS


port changeMeta :
    { querySelector : String
    , fieldName : String
    , content : String
    , type_ : String
    }
    -> Cmd msg
