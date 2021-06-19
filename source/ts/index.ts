import searches from "./searches";

// Utilities.

const onLoad = (cb: () => any) =>
  /interactive|complete/.test(document.readyState)
    ? setTimeout(cb, 0)
    : document.addEventListener("DOMContentLoaded", cb, { once: true });
const sel = document.querySelector.bind(document);
const makeEl = (
  tag: string,
  attrs?: Record<string, string>,
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
