type size = [#Str(string) | #Number(float)]

@module("polished")
external between: (
  ~fromSize: @unwrap [#Str(string) | #Number(float)],
  ~toSize: @unwrap [#Str(string) | #Number(float)],
  ~minScreen: option<string>,
  ~maxScreen: option<string>,
) => string = "between"
let between = (~minScreen=?, ~maxScreen=?, ~fromSize, ~toSize, ()) =>
  between(~fromSize, ~toSize, ~minScreen, ~maxScreen)

@module("polished")
external clearFix: option<string> => 'styles = "clearFix"
let clearFix = (~parent=?) => parent->clearFix

@module("polished")
external cover: (~offset: @unwrap [#Str(string) | #Number(float)]) => 'styles = "cover"
let cover = (~offset=?, ()) => {
  let offset = switch offset {
  | None => #Number(0.)
  | Some(offset) => offset
  }

  cover(~offset)
}
