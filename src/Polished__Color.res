type color = string

type contrastScores = {
  "AA": bool,
  "AALarge": bool,
  "AAA": bool,
  "AAALarge": bool,
}

type hslColor = {"hue": float, "saturation": float, "lightness": float}

type rgbColor = {"red": int, "green": int, "blue": int}

type rgbaColor = {"red": int, "green": int, "blue": int, "alpha": float}

@module("polished")
external shade: (float, color) => color = "shade"
let shade = (color, ~amount) => color |> shade(amount)

@module("polished")
external tint: (float, color) => color = "tint"
let tint = (color, ~amount) => color |> tint(amount)

@module("polished")
external lighten: (float, color) => color = "lighten"
let lighten = (color, ~amount) => color |> lighten(amount)

@module("polished")
external darken: (float, color) => color = "darken"
let darken = (color, ~amount) => color |> darken(amount)

@module("polished")
external hsl: (float, float, float) => color = "hsl"
let hsl = (~hue, ~saturation, ~lightness) => hsl(hue, saturation, lightness)

@module("polished")
external extAdjustHue: (float, color) => color = "adjustHue"
let adjustHue = (color, ~degree) => color |> extAdjustHue(degree)

@module("polished")
external complement: color => color = "complement"
let complement = complement

@module("polished")
external desaturate: (float, color) => color = "desaturate"
let desaturate = (color, ~amount) => color |> desaturate(amount)

@module("polished")
external getContrast: (color, color) => float = "getContrast"
let getContrast = getContrast

@module("polished")
external getLuminance: color => float = "getLuminance"
let getLuminance = getLuminance

@module("polished")
external grayscale: color => color = "grayscale"
let grayscale = grayscale

@module("polished")
external hsla: (float, float, float, float) => color = "hsla"
let hsla = (~hue, ~saturation, ~lightness, ~alpha) =>
  hsla(hue, saturation, lightness, alpha)

@module("polished")
external invert: color => color = "invert"
let invert = invert

@module("polished")
external meetsContrastGuidelines: (color, color) => contrastScores =
  "meetsContrastGuidelines"
let meetsContrastGuidelines = meetsContrastGuidelines

@module("polished")
external extTransparentize: (float, color) => color = "transparentize"
let transparentize = (color, ~amount) => color |> extTransparentize(amount)

@module("polished")
external hslToColorString: hslColor => color = "hslToColorString"
let hslToColorString = hslToColorString

@module("polished")
external mix: (float, color, color) => color = "mix"
let mix = (color1, color2, ~weight) => color2 |> mix(weight, color1)

@module("polished")
external opacify: (float, color) => color = "opacify"
let opacify = (color, ~amount) => color |> opacify(amount)

@module("polished")
external parseToHsl: color => hslColor = "parseToHsl"
let parseToHsl = parseToHsl

@module("polished")
external parseToRgb: color => rgbColor = "parseToRgb"
let parseToRgb = parseToRgb

@module("polished")
external readableColor: (color, color, color, bool) => color = "readableColor"
let readableColor = (
  color,
  ~lightReturnColor="#fff",
  ~darkReturnColor="#000",
  ~strict=true,
  (),
) => readableColor(color, lightReturnColor, darkReturnColor, strict)

@module("polished")
external rgb: rgbColor => color = "rgb"
let rgb = rgb

@module("polished")
external rgba: rgbaColor => color = "rgba"
let rgba = rgba

@module("polished")
external saturate: (float, color) => color = "saturate"
let saturate = (color, ~amount) => color |> saturate(amount)

@module("polished")
external setHue: (int, color) => color = "setHue"
let setHue = (color, ~hue) => color |> setHue(hue)

@module("polished")
external setLightness: (float, color) => color = "setLightness"
let setLightness = (color, ~lightness) => color |> setLightness(lightness)

@module("polished")
external setSaturation: (float, color) => color = "setSaturation"
let setSaturation = (color, ~saturation) => color |> setSaturation(saturation)
