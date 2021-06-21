module Searches exposing (..)


type alias Search =
    { name : String
    , url : String
    }


searches : List Search
searches =
    [ { name = "Duck"
      , url = "https://duckduckgo.com/?q=%s"
      }
    , { name = "Google"
      , url = "http://www.google.com/search?q=%s"
      }
    , { name = "goo"
      , url = "https://dictionary.goo.ne.jp/freewordsearcher.html?MT=%s&mode=0&kind=all"
      }
    , { name = "ALC"
      , url = "http://eow.alc.co.jp/%s"
      }
    , { name = "jisho"
      , url = "http://jisho.org/search/%s"
      }
    , { name = "日 類語"
      , url = "http://thesaurus.weblio.jp/content_find?query=%s&searchType=exact"
      }
    , { name = "数え方"
      , url = "http://www.sanabo.com/kazoekata/?s=%s"
      }
    , { name = "Y!辞書"
      , url = "http://dic.search.yahoo.co.jp/dsearch?p=%s&dic_id=jj&stype=prefix&b=1"
      }
    , { name = "英→英"
      , url = "http://www.thefreedictionary.com/%s"
      }
    , { name = "西→英"
      , url = "http://www.wordreference.com/enit/translation.asp?dict=esen&w=%s"
      }
    , { name = "英 類語"
      , url = "http://thesaurus.com/browse/%s"
      }
    , { name = "RAE"
      , url = "https://dle.rae.es/?w=%s"
      }
    , { name = "仏→英"
      , url = "http://www.wordreference.com/enit/translation.asp?enit=%s&dict=fren"
      }
    , { name = "Linguee英中"
      , url = "https://www.linguee.com/english-chinese/search?query=%s"
      }
    , { name = "Linguee英日"
      , url = "https://www.linguee.com/english-japanese/search?query=%s"
      }
    , { name = "Linguee西英"
      , url = "https://www.linguee.com/english-spanish/search?query=%s"
      }
    , { name = "Wiki中"
      , url = "http://zh.wikipedia.org/w/index.php?search=%s"
      }
    , { name = "Wiki日"
      , url = "http://ja.wikipedia.org/w/index.php?search=%s"
      }
    , { name = "Wiki英"
      , url = "http://en.wikipedia.org/w/index.php?search=%s"
      }
    , { name = "Wiki西"
      , url = "http://es.wikipedia.org/w/index.php?search=%s"
      }
    , { name = "画像"
      , url = "http://www.google.com/search?safe=off&tbm=isch&q=%s"
      }
    , { name = "動画"
      , url = "https://www.google.com/search?safe=off&tbm=vid&q=%s"
      }
    , { name = "nico"
      , url = "http://www.nicovideo.jp/search/%s"
      }
    , { name = "TMDb"
      , url = "https://www.themoviedb.org/search?query=%s"
      }
    , { name = "BGG"
      , url = "https://boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q=%s"
      }
    , { name = "Amazon.com"
      , url = "http://www.amazon.com/s/?field-keywords=%s"
      }
    , { name = "Amazon.co.jp"
      , url = "http://www.amazon.co.jp/s/?field-keywords=%s"
      }
    ]
