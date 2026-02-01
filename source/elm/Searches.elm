module Searches exposing (searches)

import Search exposing (GroupedSearches, QueryUrl, queryUrl)


searches : GroupedSearches
searches =
    { regular =
        [ { name = "Duck"
          , url = s "https://noai.duckduckgo.com/?q=" ""
          }
        , { name = "Eco"
          , url = s "https://www.ecosia.org/search?method=index&q=" ""
          }

        -- See: https://searx.space/
        , { name = "Sxng"
          , url = s "https://kantan.cat/search?category_general=1&language=auto&time_range=&safesearch=0&theme=simple&q=" ""
          }
        , { name = "Google"
          , url = s "http://www.google.com/search?q=" "&udm=14"
          }
        ]
    , dictionariesMono =
        [ { name = "英"
          , url = s "http://www.thefreedictionary.com/" ""
          }
        , { name = "RAE"
          , url = s "https://dle.rae.es/?w=" ""
          }
        ]
    , dictionaries =
        [ { name = "Wikt英"
          , url = s "https://en.wiktionary.org/wiki/" ""
          }
        , { name = "ALC"
          , url = s "http://eow.alc.co.jp/" ""
          }
        , { name = "jisho"
          , url = s "http://jisho.org/search/" ""
          }
        , { name = "日 類語"
          , url = s "http://thesaurus.weblio.jp/content_find?query=" "&searchType=exact"
          }
        , { name = "数え方"
          , url = s "http://www.sanabo.com/kazoekata/?s=" ""
          }
        , { name = "Y!辞書"
          , url = s "http://dic.search.yahoo.co.jp/dsearch?p=" "&dic_id=jj&stype=prefix&b=1"
          }
        , { name = "西→英"
          , url = s "http://www.wordreference.com/esen/" ""
          }
        , { name = "英 類語"
          , url = s "http://thesaurus.com/browse/" ""
          }
        , { name = "仏→英"
          , url = s "http://www.wordreference.com/fren/" ""
          }
        , { name = "Linguee英中"
          , url = s "https://www.linguee.com/english-chinese/search?query=" ""
          }
        , { name = "Linguee英日"
          , url = s "https://www.linguee.com/english-japanese/search?query=" ""
          }
        , { name = "Linguee西英"
          , url = s "https://www.linguee.com/english-spanish/search?query=" ""
          }
        ]
    , images =
        [ { name = "圖片"
          , url = s "https://duckduckgo.com/?q=" "&iax=images&ia=images"
          }
        , { name = "影片"
          , url = s "https://duckduckgo.com/?q=-site%3Ayoutube.com%20" "&iax=videos&ia=videos"
          }
        , { name = "nico"
          , url = s "http://www.nicovideo.jp/search/" ""
          }
        ]
    , wikipedia =
        [ { name = "Wiki中"
          , url = s "http://zh.wikipedia.org/w/index.php?search=" ""
          }
        , { name = "Wiki日"
          , url = s "http://ja.wikipedia.org/w/index.php?search=" ""
          }
        , { name = "Wiki英"
          , url = s "http://en.wikipedia.org/w/index.php?search=" ""
          }
        , { name = "Wiki西"
          , url = s "http://es.wikipedia.org/w/index.php?search=" ""
          }
        ]
    , other =
        [ { name = "TMDb"
          , url = s "https://www.themoviedb.org/search?query=" ""
          }
        , { name = "BGG"
          , url = s "https://boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q=" ""
          }
        , { name = "Amazon.com"
          , url = s "http://www.amazon.com/s/?field-keywords=" ""
          }
        , { name = "Amazon.co.jp"
          , url = s "http://www.amazon.co.jp/s/?field-keywords=" ""
          }
        ]
    }


s : String -> String -> QueryUrl
s =
    queryUrl
