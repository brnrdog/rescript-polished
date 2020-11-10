# rescript-polished

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brnrdog/rescript-polished/Release?style=flat-square)
[![npm](https://img.shields.io/npm/v/rescript-polished?style=flat-square)](https://www.npmjs.com/package/rescript-polished)
[![Codecov](https://img.shields.io/codecov/c/github/brnrdog/rescript-polished?style=flat-square)](https://codecov.io/gh/brnrdog/rescript-polished)

Bindings for [polished](https://polished.js.org/), _a lightweight toolset for writing styles in JavaScript_, __now in ReScript__ ✨.

**Note:** these bindings are still under development, check the [Polished](https://github.com/brnrdog/rescript-polished/blob/master/src/Polished.res) module to see the available functions.

## Installation

Add to your project using the package manager of your preference:

```bash
npm install --save rescript-polished
# or yarn:
yarn add rescript-polished
```

Add `rescript-polished` as a `bs-dependency` in your bsconfig.json:

```json
"bs-dependencies": [
  "rescript-polished"
]
```

## Usage

For better convenience in ReScript, these bindings were written in a data-first style, so the API might slightly different from the original polished package. Keep that in mind when consuming the Polished module.

```rescript
open Polished

let primaryColor      = "#ed5051"
let primaryColorLight = primaryColor -> Polished.lighten(~amount=0.25) // #f9c4c4
let primaryColorDark  = primaryColor -> Polished.darken(~amount=0.25) // #ac1213
let secondaryColor    = primaryColor -> Polished.complement // #50edec
```


## License

MIT
