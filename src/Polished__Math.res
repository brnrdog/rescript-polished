type formula = string

@module("polished")
external math: (formula, 'a) => string = "math"
let math = math
