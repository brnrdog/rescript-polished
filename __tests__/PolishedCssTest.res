open Jest
open Expect
open PolishedCss

let toEqual = (x, y) => x->toEqual(y)

describe("Color", () => {
  open Color

  test("shade with hex", () => {
    #hex("ff0000")->shade(~amount=0.25)->expect->toEqual(#hex("bf0000"))
  })

  test("shade with rgb", () => {
    Css_AtomicTypes.Color.rgb(255, 0, 0)->shade(~amount=0.25)->expect->toEqual(#hex("bf0000"))
  })

  test("shade with rgba", () => {
    Css_AtomicTypes.Color.rgba(255, 0, 0, #num(0.25))
    ->shade(~amount=0.25)
    ->expect
    ->toEqual(Css_AtomicTypes.Color.rgba(76, 0, 0, #num(0.4375)))
  })

  test("tint with hex", () => {
    #hex("ff0000")->tint(~amount=0.25)->expect->toEqual(#hex("ff3f3f"))
  })

  test("tint with rgb", () => {
    Css_AtomicTypes.Color.rgb(255, 0, 0)->tint(~amount=0.25)->expect->toEqual(#hex("ff3f3f"))
  })

  test("darken with hex", () => {
    #hex("ff0000")->darken(~amount=0.25)->expect->toEqual(#hex("800000"))
  })

  test("lighten with hex", () => {
    #hex("ff0000")->lighten(~amount=0.25)->expect->toEqual(#hex("ff8080"))
  })

  test("transparentize with hex", () => {
    #hex("ff0000")
    ->transparentize(~amount=0.5)
    ->expect
    ->toEqual(Utils.Rgba.fromString("rgba(255, 0, 0, 0.5)"))
  })

  test("getContrast with hex", () => {
    #hex("ff0000")->getContrast(#hex("0000ff"))->expect->toEqual(2.16)
  })

  test("getLuminance with hex", () => {
    #hex("ff0000")->getLuminance->expect->toEqual(0.213)
  })

  test("grayscale with hex", () => {
    #hex("ff0000")->grayscale->expect->toEqual(#hex("808080"))
  })

  test("desaturate with hex", () => {
    #hex("ff0000")->desaturate(~amount=0.3)->expect->toEqual(#hex("d92626"))
  })

  test("complement with hex", () => {
    #hex("ff0000")->complement->expect->toEqual(#hex("0ff"))
  })

  test("adjustHue with hex", () => {
    #hex("ff0000")->adjustHue(~degree=0.3)->expect->toEqual(#hex("ff0100"))
  })

  describe("Utils", () => {
    open Color.Utils

    test("fromString with hex", () => {
      "#ff0000"->fromString->expect->toEqual(#hex("ff0000"))
    })

    test("fromString with rgba", () => {
      "rgba(255, 0, 0, 0.5)"->fromString->expect->toEqual(#rgba(255, 0, 0, #num(0.5)))
    })
  })
})
