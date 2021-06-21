import { Elm } from "../elm/Main.elm";

console.log(Elm);

const app = Elm.Main.init({
  node: document.getElementById("elm"),
  flags: {},
});
