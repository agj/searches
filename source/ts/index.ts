type SearchDescription = Readonly<{
  name: string;
  url: string;
}>;

const searches: SearchDescription[] = [
  { name: "Duck", url: "https://duckduckgo.com/?q=%s" },
  { name: "Google", url: "http://www.google.com/search?q=%s" },
  {
    name: "goo",
    url: "https://dictionary.goo.ne.jp/freewordsearcher.html?MT=%s&mode=0&kind=all",
  },
  { name: "ALC", url: "http://eow.alc.co.jp/%s" },
  { name: "jisho", url: "http://jisho.org/search/%s" },
  {
    name: "日 類語",
    url: "http://thesaurus.weblio.jp/content_find?query=%s&searchType=exact",
  },
  { name: "数え方", url: "http://www.sanabo.com/kazoekata/?s=%s" },
  {
    name: "Y!辞書",
    url: "http://dic.search.yahoo.co.jp/dsearch?p=%s&dic_id=jj&stype=prefix&b=1",
  },
  { name: "英→英", url: "http://www.thefreedictionary.com/%s" },
  {
    name: "西→英",
    url: "http://www.wordreference.com/enit/translation.asp?dict=esen&w=%s",
  },
  { name: "英 類語", url: "http://thesaurus.com/browse/%s" },
  { name: "RAE", url: "https://dle.rae.es/?w=%s" },
  {
    name: "仏→英",
    url: "http://www.wordreference.com/enit/translation.asp?enit=%s&dict=fren",
  },
  {
    name: "Linguee英中",
    url: "https://www.linguee.com/english-chinese/search?query=%s",
  },
  {
    name: "Linguee英日",
    url: "https://www.linguee.com/english-japanese/search?query=%s",
  },
  {
    name: "Linguee西英",
    url: "https://www.linguee.com/english-spanish/search?query=%s",
  },
  { name: "Wiki中", url: "http://zh.wikipedia.org/w/index.php?search=%s" },
  { name: "Wiki日", url: "http://ja.wikipedia.org/w/index.php?search=%s" },
  { name: "Wiki英", url: "http://en.wikipedia.org/w/index.php?search=%s" },
  { name: "Wiki西", url: "http://es.wikipedia.org/w/index.php?search=%s" },
  {
    name: "画像",
    url: "http://www.google.com/search?safe=off&tbm=isch&q=%s",
  },
  {
    name: "動画",
    url: "https://www.google.com/search?safe=off&tbm=vid&q=%s",
  },
  { name: "nico", url: "http://www.nicovideo.jp/search/%s" },
  { name: "TMDb", url: "https://www.themoviedb.org/search?query=%s" },
  {
    name: "BGG",
    url: "https://boardgamegeek.com/geeksearch.php?action=search&objecttype=boardgame&q=%s",
  },
  { name: "Amazon.com", url: "http://www.amazon.com/s/?field-keywords=%s" },
  {
    name: "Amazon.co.jp",
    url: "http://www.amazon.co.jp/s/?field-keywords=%s",
  },
];

// Utilities.

const onLoad = (cb: () => any) =>
  /interactive|complete/.test(document.readyState)
    ? setTimeout(cb, 0)
    : document.addEventListener("DOMContentLoaded", cb, { once: true });
const sel = document.querySelector.bind(document);
const makeEl = <Attrs extends Record<string, string>>(
  tag: string,
  attrs?: Attrs,
  ...children: (HTMLElement | string)[]
): HTMLElement => {
  const el = document.createElement(tag);
  if (attrs) {
    for (const [attr, value] of Object.entries(attrs)) {
      el.setAttribute(attr, value);
    }
  }
  children
    .map((obj) => {
      return typeof obj === "string" ? document.createTextNode(obj) : obj;
    })
    .forEach((node) => {
      el.appendChild(node);
    });
  return el;
};

onLoad(() => {
  const query: HTMLInputElement | null = sel("#query textarea");
  const buttonsContainer = sel("#buttons");

  console.log(query, buttonsContainer);

  if (query && buttonsContainer) {
    searches
      .map((obj) => {
        const button = makeEl("input", { type: "button", value: obj.name });
        button.addEventListener("click", () => {
          window.location.href = obj.url.replace(
            "%s",
            encodeURIComponent(query.value).replace(/\n/g, "")
          );
        });
        return button;
      })
      .forEach((button) => buttonsContainer.appendChild(button));

    const resetQuerySize = () => {
      query.style.height = "";
      query.style.height = query.scrollHeight + 10 + "px";
    };
    query.addEventListener("input", resetQuerySize);
    resetQuerySize();
  }
});
