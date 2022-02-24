module Search exposing (Query, QueryUrl, Search, SearchGroup, Url, queryUrl, toUrl)

import Url exposing (percentEncode)


type alias Search =
    { name : String
    , url : QueryUrl
    }


type alias SearchGroup =
    { name : String
    , searches : List Search
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
