open Jest
open Expect
open PolishedCss

let toEqual = (x, y) => x |> toEqual(y)

describe("Color", () => {
  open Color

  test("shade", () => {
    #hex("ff0000")->shade(~amount=0.25)->expect->toEqual(#hex("bf0000"))
  })

  test("tint", () => {
    #hex("ff0000")->tint(~amount=0.25)->expect->toEqual(#hex("ff3f3f"))
  })

  test("darken", () => {
    #hex("ff0000")->darken(~amount=0.25)->expect->toEqual(#hex("800000"))
  })

  test("lighten", () => {
    #hex("ff0000")->lighten(~amount=0.25)->expect->toEqual(#hex("ff8080"))
  })

  test("transparentize", () => {
    #hex("ff0000")
    ->transparentize(~amount=0.5)
    ->expect
    ->toEqual(Rgba.fromString("rgba(255, 0, 0, 0.5)"))
  })
})
