type color = string

type contrastScores = {
  "AA": bool,
  "AALarge": bool,
  "AAA": bool,
  "AAALarge": bool,
}

@bs.module("polished") external extShade: (float, color) => color = "shade"
let shade = (color, ~amount) => color |> extShade(amount)

@bs.module("polished") external extTint: (float, color) => color = "tint"
let tint = (color, ~amount) => color |> extTint(amount)

@bs.module("polished") external extLighten: (float, color) => color = "lighten"
let lighten  = (color, ~amount) => color |> extLighten(amount)

@bs.module("polished") external extDarken: (float, color) => color = "darken"
let darken  = (color, ~amount) => color |> extDarken(amount)

@bs.module("polished") external extHsl: (int, float, float) => color = "hsl"
let hsl = (~hue, ~saturation, ~lightness) => extHsl(hue, saturation, lightness)

@bs.module("polished") external extAdjustHue: (float, color) => color = "adjustHue"
let adjustHue = (color, ~degree) => color |> extAdjustHue(degree)

@bs.module("polished") external extCompletement: (color) => color = "complement"
let complement = extCompletement

@bs.module("polished") external extDesaturate: (float, color) => color = "desaturate"
let desaturate = (color, ~amount) => color |> extDesaturate(amount)

@bs.module("polished") external extGetContrast: (color, color) => float = "getContrast"
let getContrast = (color1, color2) => extGetContrast(color1, color2)

@bs.module("polished") external extGetLuminance: color => float = "getLuminance"
let getLuminance = extGetLuminance

@bs.module("polished") external extGrayscale: color => color = "grayscale"
let grayscale = extGrayscale

@bs.module("polished") external extHsla: (int, float, float, float) => color = "hsla"
let hsla = (~hue, ~saturation, ~lightness, ~alpha) => extHsla(hue, saturation, lightness, alpha)

@bs.module("polished") external extInvert: (color) => color = "invert";
let invert = color => color |> extInvert

@bs.module("polished") external extMeetsContrastGuidelines: (color, color) => contrastScores = "meetsContrastGuidelines";
let meetsContrastGuidelines = (color1, color2) => (color1) |> extMeetsContrastGuidelines(color2)