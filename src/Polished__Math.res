type formula = string

@bs.module("polished")
external math: (formula, 'a) => string = "math"
let math = math