module Utils = {
  module StdFloat = Float
  module StdInt = Int
  open Css_AtomicTypes

  module Rgba = {
    let regex = "rgba\(\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*.\d+)\s*\)"
    let rgbaRegexGroups = (_, i) => [1, 2, 3, 4]->Array.includes(i)
    let rgbValue = v => v->Nullable.toOption->Belt.Option.getExn->StdInt.fromString->Belt.Option.getExn
    let alphaValue = v => v->Nullable.toOption->Belt.Option.getUnsafe->StdFloat.fromString->Belt.Option.getExn

    let fromString = string => {
      let result = regex->Js.Re.fromString->Js.Re.exec_(string)

      switch result {
      | None => None
      | Some(result) => {
          let values = result->Js.Re.captures->Js.Array2.filteri(rgbaRegexGroups)

          let red = values->Array.getUnsafe(0)->rgbValue
          let green = values->Array.getUnsafe(1)->rgbValue
          let blue = values->Array.getUnsafe(2)->rgbValue
          let alpha = values->Array.getUnsafe(3)->alphaValue

          Some(Color.rgba(red, green, blue, #num(alpha)))
        }
      }
    }
  }

  module Hex = {
    let fromString = string =>
      #hex(string->Js.String2.slice(~from=1, ~to_=Js.String.length(string)))
  }

  let toString = Color.toString

  let fromString = string => {
    switch string->Js.String2.slice(~from=0, ~to_=4) {
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
