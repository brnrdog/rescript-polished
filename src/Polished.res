@bs.module("polished") external extShade: (float, string) => string = "shade"
let shade = (color, ~amount) => color |> extShade(amount)

@bs.module("polished") external extTint: (float, string) => string = "tint"
let tint = (color, ~amount) => color |> extTint(amount)

@bs.module("polished") external extLighten: (float, string) => string = "lighten"
let lighten  = (color, ~amount) => color |> extLighten(amount)

@bs.module("polished") external extDarken: (float, string) => string = "darken"
let darken  = (color, ~amount) => color |> extDarken(amount)