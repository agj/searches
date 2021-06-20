module Main exposing (main)

import Color
import Element exposing (Element)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Pages exposing (images, pages)
import Pages.Manifest as Manifest
import Pages.Manifest.Category
import Pages.PagePath exposing (PagePath)
import Pages.Platform
import Pages.StaticHttp as StaticHttp


manifest : Manifest.Config Pages.PathKey
manifest =
    { backgroundColor = Just Color.white
    , categories = [ Pages.Manifest.Category.education ]
    , displayMode = Manifest.Standalone
    , orientation = Manifest.Portrait
    , description = "elm-pages-starter - A statically typed site generator."
    , iarcRatingId = Nothing
    , name = "elm-pages-starter"
    , themeColor = Just Color.white
    , startUrl = Pages.PagePath.external ""
    , shortName = Just "elm-pages-starter"
    , sourceIcon = images.icon
    , icons = []
    }


type alias Rendered =
    Element Msg


main : Pages.Platform.Program Model Msg () Rendered Pages.PathKey
main =
    Pages.Platform.init
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , documents = []
        , manifest = manifest
        , canonicalSiteUrl = canonicalSiteUrl
        , onPageChange = Nothing
        , internals = Pages.internals
        }
        |> Pages.Platform.withFileGenerator generateFiles
        |> Pages.Platform.toProgram


generateFiles :
    List
        { path : PagePath Pages.PathKey
        , frontmatter : ()
        , body : String
        }
    ->
        StaticHttp.Request
            (List
                (Result
                    String
                    { path : List String
                    , content : String
                    }
                )
            )
generateFiles siteMetadata =
    StaticHttp.succeed
        []


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( Model, Cmd.none )


type alias Msg =
    ()


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        () ->
            ( model, Cmd.none )



--subscriptions : Model -> Sub Msg


subscriptions _ _ _ =
    Sub.none


view :
    List ( PagePath Pages.PathKey, () )
    ->
        { path : PagePath Pages.PathKey
        , frontmatter : ()
        }
    ->
        StaticHttp.Request
            { view : Model -> Rendered -> { title : String, body : Html Msg }
            , head : List (Head.Tag Pages.PathKey)
            }
view siteMetadata page =
    StaticHttp.succeed
        { view =
            \model viewForPage ->
                { title = "Test"
                , body =
                    Element.text "Hello World!"
                        |> Element.layout []
                }
        , head = head
        }


head : List (Head.Tag Pages.PathKey)
head =
    Seo.summaryLarge
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages-starter"
        , image =
            { url = images.icon
            , alt = "logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = siteTagline
        , locale = Nothing
        , title = "title"
        }
        |> Seo.website


canonicalSiteUrl : String
canonicalSiteUrl =
    "https://elm-pages-starter.netlify.com"


siteTagline : String
siteTagline =
    "Starter blog for elm-pages"
