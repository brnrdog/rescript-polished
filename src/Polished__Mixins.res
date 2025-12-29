module Size = {
  @unboxed
  type rec t = Any('a): t
  let makeString: string => t = s => Any(s)
  let makeFloat: float => t = i => Any(i)
}

type fluidRangeConfiguration = {
  prop: string,
  fromSize: Size.t,
  toSize: Size.t,
}

@module("polished")
external between: (
  ~fromSize: Size.t,
  ~toSize: Size.t,
  ~minScreen: option<string>,
  ~maxScreen: option<string>,
) => string = "between"
let between = (~minScreen=?, ~maxScreen=?, ~fromSize, ~toSize, ()) =>
  between(~fromSize, ~toSize, ~minScreen, ~maxScreen)

@module("polished")
external clearFix: option<string> => 'styles = "clearFix"
let clearFix = (~parent=?) => parent->clearFix

@module("polished")
external cover: (~offset: Nullable.t<Size.t>) => 'styles = "cover"
let cover = (~offset=?, ()) => cover(~offset=Nullable.fromOption(offset))

@module("polished")
external ellipsis: (~width: Nullable.t<Size.t>, ~lines: option<int>) => 'styles = "ellipsis"
let ellipsis = (~width=?, ~lines=?, ()) => {
  ellipsis(~width=Nullable.fromOption(width), ~lines)
}

@module("polished")
external fluidRange: (
  fluidRangeConfiguration,
  ~minScreen: Nullable.t<string>,
  ~maxScreen: Nullable.t<string>,
) => 'styles = "fluidRange"
let fluidRange = (~minScreen=?, ~maxScreen=?, cssProp) =>
  fluidRange(
    cssProp,
    ~minScreen=Nullable.fromOption(minScreen),
    ~maxScreen=Nullable.fromOption(maxScreen),
  )

@module("polished")
external fluidRangeWithArray: (
  array<fluidRangeConfiguration>,
  ~minScreen: Nullable.t<string>,
  ~maxScreen: Nullable.t<string>,
) => 'styles = "fluidRange"
let fluidRangeWithArray = (~minScreen=?, ~maxScreen=?, cssProps) =>
  fluidRangeWithArray(
    cssProps,
    ~minScreen=Nullable.fromOption(minScreen),
    ~maxScreen=Nullable.fromOption(maxScreen),
  )
