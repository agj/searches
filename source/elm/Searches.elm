module Searches exposing (searches)

import Search exposing (QueryUrl, Search, queryUrl)


searches : List Search
searches =
    [ { name = "Duck"
      , url = s "https://duckduckgo.com/?q=" ""
      }
    , { name = "Google"
      , url = s "http://www.google.com/search?q=" ""
      }
    , { name = "goo"
      , url = s "https://dictionary.goo.ne.jp/freewordsearcher.html?MT=" "&mode=0&kind=all"
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
    , { name = "英"
      , url = s "http://www.thefreedictionary.com/" ""
      }
    , { name = "西→英"
      , url = s "http://www.wordreference.com/enit/translation.asp?dict=esen&w=" ""
      }
    , { name = "英 類語"
      , url = s "http://thesaurus.com/browse/" ""
      }
    , { name = "RAE"
      , url = s "https://dle.rae.es/?w=" ""
      }
    , { name = "仏→英"
      , url = s "http://www.wordreference.com/enit/translation.asp?enit=" "&dict=fren"
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
    , { name = "Wiki中"
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
    , { name = "圖片"
      , url = s "https://duckduckgo.com/?q=" "&iax=images&ia=images"
      }
    , { name = "影片" 
      , url = s "https://duckduckgo.com/?q=" "&iax=videos&ia=videos"
      }
    , { name = "nico"
      , url = s "http://www.nicovideo.jp/search/" ""
      }
    , { name = "TMDb"
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


s : String -> String -> QueryUrl
s =
    queryUrl
