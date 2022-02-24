module Search exposing (GroupedSearches, Query, QueryUrl, Search, Url, queryUrl, toUrl)

import Url exposing (percentEncode)


type alias Search =
    { name : String
    , url : QueryUrl
    }


type alias GroupedSearches =
    { regular : List Search
    , dictionaries : List Search
    , images : List Search
    , wikipedia : List Search
    , other : List Search
    }


type QueryUrl
    = QueryUrl
        { beforeQuery : String
        , afterQuery : String
        }


type alias Query =
    String


type alias Url =
    String


toUrl : Query -> QueryUrl -> Url
toUrl query (QueryUrl { beforeQuery, afterQuery }) =
    beforeQuery ++ percentEncode query ++ afterQuery


queryUrl : String -> String -> QueryUrl
queryUrl beforeQuery afterQuery =
    QueryUrl
        { beforeQuery = beforeQuery
        , afterQuery = afterQuery
        }
