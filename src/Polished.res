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

@bs.module("polished") 
external shade: (float, color) => color = "shade"
let shade = (color, ~amount) => color |> shade(amount)

@bs.module("polished") 
external tint: (float, color) => color = "tint"
let tint = (color, ~amount) => color |> tint(amount)

@bs.module("polished") 
external lighten: (float, color) => color = "lighten"
let lighten = (color, ~amount) => color |> lighten(amount)

@bs.module("polished") 
external extDarken: (float, color) => color = "darken"
let darken = (color, ~amount) => color |> extDarken(amount)

@bs.module("polished") 
external extHsl: (int, float, float) => color = "hsl"
let hsl = (~hue, ~saturation, ~lightness) => extHsl(hue, saturation, lightness)

@bs.module("polished")
external extAdjustHue: (float, color) => color = "adjustHue"
let adjustHue = (color, ~degree) => color |> extAdjustHue(degree)

@bs.module("polished") 
external complement: color => color = "complement"
let complement = complement

@bs.module("polished")
external extDesaturate: (float, color) => color = "desaturate"
let desaturate = (color, ~amount) => color |> extDesaturate(amount)

@bs.module("polished")
external extGetContrast: (color, color) => float = "getContrast"
let getContrast = (color1, color2) => extGetContrast(color1, color2)

@bs.module("polished") 
external getLuminance: color => float = "getLuminance"
let getLuminance = getLuminance

@bs.module("polished") 
external grayscale: color => color = "grayscale"
let grayscale = grayscale

@bs.module("polished")
external hsla: (int, float, float, float) => color = "hsla"
let hsla = (~hue, ~saturation, ~lightness, ~alpha) => 
  hsla(hue, saturation, lightness, alpha)

@bs.module("polished") 
external invert: color => color = "invert"
let invert = invert

@bs.module("polished") 
external meetsContrastGuidelines: (color, color) => contrastScores = "meetsContrastGuidelines"
let meetsContrastGuidelines = meetsContrastGuidelines

@bs.module("polished") 
external extTransparentize: (float, color) => color = "transparentize"
let transparentize = (color, ~amount) => color |> extTransparentize(amount)

@bs.module("polished")
external hslToColorString: hslColor => color = "hslToColorString"
let hslToColorString = hslToColorString

@bs.module("polished") 
external mix: (float, color, color) => color = "mix"
let mix = (color1, color2, ~weight) => color2 |> mix(weight, color1)

@bs.module("polished") 
external opacify: (float, color) => color = "opacify"
let opacify = (color, ~amount) => color |> opacify(amount)

@bs.module("polished") 
external parseToHsl: color => hslColor = "parseToHsl"
let parseToHsl = parseToHsl

@bs.module("polished") 
external parseToRgb: color => rgbColor = "parseToRgb"
let parseToRgb = parseToRgb

@bs.module("polished")
external readableColor: (color, color, color, bool) => color = "readableColor"
let readableColor = (
  color, 
  ~lightReturnColor="#fff", 
  ~darkReturnColor="#000", 
  ~strict=true, 
  ()
) => readableColor(color, lightReturnColor, darkReturnColor, strict)

@bs.module("polished")
external rgb: rgbColor => color = "rgb"
let rgb = rgb

@bs.module("polished")
external rgba: rgbaColor => color = "rgba"
let rgba = rgba