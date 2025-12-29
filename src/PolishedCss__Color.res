module Utils = {
  module StdFloat = Float
  module StdInt = Int

  module Rgba = {
    let regex = "rgba\(\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*.\d+)\s*\)"
    let rgbaRegexGroups = (_, i) => [1, 2, 3, 4]->Array.includes(i)
    let rgbValue = v => v->Nullable.toOption->Belt.Option.getExn->StdInt.fromString->Belt.Option.getExn
    let alphaValue = v => v->Nullable.toOption->Belt.Option.getUnsafe->StdFloat.fromString->Belt.Option.getExn

    let fromString = string => {
      let result = regex->RegExp.fromString->RegExp.exec(string)

      switch result {
      | None => None
      | Some(result) => {
          let values = result->RegExp.Result.matches->Array.filterWithIndex(rgbaRegexGroups)

          let red = values->Array.getUnsafe(0)->rgbValue
          let green = values->Array.getUnsafe(1)->rgbValue
          let blue = values->Array.getUnsafe(2)->rgbValue
          let alpha = values->Array.getUnsafe(3)->alphaValue

          Some(Css_Js_Core.Types.Color.rgba(red, green, blue, #num(alpha)))
        }
      }
    }
  }

  module Hex = {
    let fromString = string =>
      #hex(string->String.slice(~start=1, ~end=String.length(string)))
  }

  let toString = Css_Js_Core.Types.Color.toString

  let fromString = string => {
    switch string->String.slice(~start=0, ~end=4) {
    | "rgba" => string->Rgba.fromString->Belt.Option.getExn
    | _ => string->Hex.fromString
    }
  }
}

let shade = (color, ~amount) => {
  color->Utils.toString->Polished__Color.shade(~amount)->Utils.fromString
}

let tint = (color, ~amount) =>
  color->Utils.toString->Polished__Color.tint(~amount)->Utils.fromString

let lighten = (color, ~amount) =>
  color->Utils.toString->Polished__Color.lighten(~amount)->Utils.fromString

let darken = (color, ~amount) =>
  color->Utils.toString->Polished__Color.darken(~amount)->Utils.fromString

let transparentize = (color, ~amount) =>
  color->Utils.toString->Polished__Color.transparentize(~amount)->Utils.Rgba.fromString

let getContrast = (c1, c2) => c1->Utils.toString->Polished__Color.getContrast(c2->Utils.toString)

let getLuminance = color => color->Utils.toString->Polished__Color.getLuminance

let grayscale = color => color->Utils.toString->Polished__Color.grayscale->Utils.fromString

let desaturate = (color, ~amount) =>
  color->Utils.toString->Polished__Color.desaturate(~amount)->Utils.fromString

let complement = color => color->Utils.toString->Polished__Color.complement->Utils.fromString

let adjustHue = (color, ~degree) =>
  color->Utils.toString->Polished__Color.adjustHue(~degree)->Utils.fromString
