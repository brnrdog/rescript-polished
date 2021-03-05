module Size = {
  @unboxed
  type rec t = Any('a): t
  let makeString: string => t = s => Any(s)
  let makeFloat: float => t = i => Any(i)
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
external cover: (~offset: Js.undefined<Size.t>) => 'styles = "cover"
let cover = (~offset=?, ()) => cover(~offset=Js.Undefined.fromOption(offset))

@module("polished")
external ellipsis: (~width: Js.undefined<Size.t>, ~lines: option<int>) => 'styles = "ellipsis"
let ellipsis = (~width=?, ~lines=?, ()) => {
  ellipsis(~width=Js.Undefined.fromOption(width), ~lines)
}
