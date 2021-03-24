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

  test("getContrast", () => {
    #hex("ff0000")->getContrast(#hex("0000ff"))->expect->toEqual(2.16)
  })

  test("getLuminance", () => {
    #hex("ff0000")->getLuminance->expect->toEqual(0.213)
  })

  test("grayscale", () => {
    #hex("ff0000")->grayscale->expect->toEqual(#hex("808080"))
  })

  test("desaturate", () => {
    #hex("ff0000")->desaturate(~amount=0.3)->expect->toEqual(#hex("d92626"))
  })

  test("complement", () => {
    #hex("ff0000")->complement->expect->toEqual(#hex("0ff"))
  })

  test("adjustHue", () => {
    #hex("ff0000")->adjustHue(~degree=0.3)->expect->toEqual(#hex("ff0100"))
  })
})
