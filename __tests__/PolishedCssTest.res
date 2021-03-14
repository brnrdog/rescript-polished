open Jest
open Expect
open PolishedCss

let toEqual = (x, y) => x |> toEqual(y)

describe("Color", () => {
  open Color

  test("shade", () => {
    "#ff0000"->shade(~amount=0.25)->expect->toEqual(#hex("bf000"))
  })

  test("tint", () => {
    "#ff0000"->tint(~amount=0.25)->expect->toEqual(#hex("ff3f3"))
  })

  test("darken", () => {
    "#ff0000"->darken(~amount=0.25)->expect->toEqual(#hex("80000"))
  })

  test("lighten", () => {
    "#ff0000"->lighten(~amount=0.25)->expect->toEqual(#hex("ff808"))
  })

  test("transparentize", () => {
    "#ff0000"->transparentize(~amount=0.5)->expect->toEqual(Rgba.fromString("rgba(255, 0, 0, 0.5)"))
  })
})