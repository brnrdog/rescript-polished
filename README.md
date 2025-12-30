# rescript-polished

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brnrdog/rescript-polished/Release?style=flat-square)
[![npm](https://img.shields.io/npm/v/rescript-polished?style=flat-square)](https://www.npmjs.com/package/rescript-polished)
[![Codecov](https://img.shields.io/codecov/c/github/brnrdog/rescript-polished?style=flat-square)](https://codecov.io/gh/brnrdog/rescript-polished)

Bindings for [polished](https://polished.js.org/), _a lightweight toolset for writing styles in JavaScript_, **now in ReScript** ✨.
Check the [Polished](https://github.com/brnrdog/rescript-polished/blob/main/src/Polished.res) module to see the available Polished functions.

## Installation

Add to your project using the package manager of your preference:

```bash
npm install --save rescript-polished
# or yarn:
yarn add rescript-polished
```

Add `rescript-polished` as a `dependency` in your rescript.json:

```json
"dependencies": [
  "rescript-polished"
]
```

## Usage

For better convenience in ReScript, these bindings were written in a data-first style, so the API might slightly different from the original polished package. Keep that in mind when consuming the Polished module.

```rescript
open Polished

let primaryColor = "#ed5051"
let primaryColorLight = primaryColor->Color.lighten(~amount=0.25) // #f9c4c4
let primaryColorDark = primaryColor->Color.darken(~amount=0.25) // #ac1213
let secondaryColor = primaryColor->Color.complement // #50edec
```

If you're using `bs-css` or `bs-css-emotion`, you can use `PolishedCss`:

```rescript
module Style = {
  open CssJs
  open PolishedCss

  let primary = #hex("e6484f") // or any possible Css_AtomicTypes.Color.t

  let button = style(. [
    background(primary),
    hover([background(primary->Color.lighten(0.25))])
    active([background(primary->Color.darken(0.25)]),
    focus([
      boxShadow(
        Shadow.box(
          primary->Color.transparentize(~amount=0.8),
          ~spread=#rem(0.25),
        ),
      ),
    ]),
  ])
}
```

## License

MIT
