module Rgba = {
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

    Css_AtomicTypes.Color.rgba(red, green, blue, #num(alpha))
  }
}

module Hex = {
  let fromString = string => #hex(string->Js.String2.slice(~from=1, ~to_=-1))
}

let shade = (color, ~amount) => color->Polished__Color.shade(~amount)->Hex.fromString

let tint = (color, ~amount) => color->Polished__Color.tint(~amount)->Hex.fromString

let lighten = (color, ~amount) => color->Polished__Color.lighten(~amount)->Hex.fromString

let darken = (color, ~amount) => color->Polished__Color.darken(~amount)->Hex.fromString

let transparentize = (color, ~amount) =>
  color->Polished__Color.transparentize(~amount)->Rgba.fromString
