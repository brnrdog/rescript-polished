type color = string

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

