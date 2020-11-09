open Jest
open Expect;

test("shade", () => {
  "#ed5051"
  -> Polished.shade(~amount=0.25)
  |> expect
  |> toBe("#b13c3c")
})

test("tint", () => {
  "#ed5051"
  -> Polished.tint(~amount=0.25)
  |> expect
  |> toBe("#f17b7c")
})

test("lighten", () => {
  "#ed5051"
  -> Polished.lighten(~amount=0.25)
  |> expect
  |> toBe("#f9c4c4")
})

test("darken", () => {
  "#ed5051"
  -> Polished.darken(~amount=0.25)
  |> expect
  |> toBe("#ac1213")
})
