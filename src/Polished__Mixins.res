type size = string

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
external clearFix: Js.undefined<string> => 'style = "clearFix"
let clearFix = (~parent=?) => parent->Js.Undefined.fromOption->clearFix
