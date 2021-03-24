module Rgba = {
  open Css_AtomicTypes

  let regex = "rgba\(\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*\.\d+(?=%))\s*,\s*(-?\d+|-?\d*.\d+)\s*\)"
  let rgbaRegexGroups = (_, i) => [1, 2, 3, 4]->Js.Array2.includes(i)
  let rgbValue = v => v->Js.Nullable.toOption->Belt.Option.getUnsafe->int_of_string
  let alphaValue = v => v->Js.Nullable.toOption->Belt.Option.getUnsafe->float_of_string

  let fromString = string => {
    let values =
      regex
      ->Js.Re.fromString
      ->Js.Re.exec_(string)
      ->Belt.Option.getUnsafe
      ->Js.Re.captures
      ->Js.Array2.filteri(rgbaRegexGroups)

    let red = values->Array.get(0)->rgbValue
    let green = values->Array.get(1)->rgbValue
    let blue = values->Array.get(2)->rgbValue
    let alpha = values->Array.get(3)->alphaValue

    Color.rgba(red, green, blue, #num(alpha))
  }
}

module Hex = {
  let fromString = string => #hex(string->Js.String2.slice(~from=1, ~to_=Js.String.length(string)))
  let toString = hex =>
    switch hex {
    | #hex(str) => "#" ++ str
    }
}

let shade = (color, ~amount) => color->Hex.toString->Polished__Color.shade(~amount)->Hex.fromString

let tint = (color, ~amount) => color->Hex.toString->Polished__Color.tint(~amount)->Hex.fromString

let lighten = (color, ~amount) =>
  color->Hex.toString->Polished__Color.lighten(~amount)->Hex.fromString

let darken = (color, ~amount) =>
  color->Hex.toString->Polished__Color.darken(~amount)->Hex.fromString

let transparentize = (color, ~amount) =>
  color->Hex.toString->Polished__Color.transparentize(~amount)->Rgba.fromString

let getContrast = (c1, c2) => c1->Hex.toString->Polished__Color.getContrast(c2->Hex.toString)

let getLuminance = color => color->Hex.toString->Polished__Color.getLuminance

let grayscale = color => color->Hex.toString->Polished__Color.grayscale->Hex.fromString

let desaturate = (color, ~amount) =>
  color->Hex.toString->Polished__Color.desaturate(~amount)->Hex.fromString

let complement = color => color->Hex.toString->Polished__Color.complement->Hex.fromString

let adjustHue = (color, ~degree) =>
  color->Hex.toString->Polished__Color.adjustHue(~degree)->Hex.fromString
