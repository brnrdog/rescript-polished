open PolishedCss
open TestFramework

let colorTests = () => {
  open Color

  [
    test("shade with hex", () => {
      assertEqual(#hex("ff0000")->shade(~amount=0.25), #hex("bf0000"))
    }),
    test("shade with rgb", () => {
      assertEqual(Css_Js_Core.Types.Color.rgb(255, 0, 0)->shade(~amount=0.25), #hex("bf0000"))
    }),
    test("shade with rgba", () => {
      assertEqual(
        Css_Js_Core.Types.Color.rgba(255, 0, 0, #num(0.25))->shade(~amount=0.25),
        Css_Js_Core.Types.Color.rgba(76, 0, 0, #num(0.4375)),
      )
    }),
    test("tint with hex", () => {
      assertEqual(#hex("ff0000")->tint(~amount=0.25), #hex("ff3f3f"))
    }),
    test("tint with rgb", () => {
      assertEqual(Css_Js_Core.Types.Color.rgb(255, 0, 0)->tint(~amount=0.25), #hex("ff3f3f"))
    }),
    test("darken with hex", () => {
      assertEqual(#hex("ff0000")->darken(~amount=0.25), #hex("800000"))
    }),
    test("lighten with hex", () => {
      assertEqual(#hex("ff0000")->lighten(~amount=0.25), #hex("ff8080"))
    }),
    test("transparentize with hex", () => {
      assertEqual(
        #hex("ff0000")->transparentize(~amount=0.5),
        Utils.Rgba.fromString("rgba(255, 0, 0, 0.5)"),
      )
    }),
    test("getContrast with hex", () => {
      assertEqual(#hex("ff0000")->getContrast(#hex("0000ff")), 2.16)
    }),
    test("getLuminance with hex", () => {
      assertEqual(#hex("ff0000")->getLuminance, 0.213)
    }),
    test("grayscale with hex", () => {
      assertEqual(#hex("ff0000")->grayscale, #hex("808080"))
    }),
    test("desaturate with hex", () => {
      assertEqual(#hex("ff0000")->desaturate(~amount=0.3), #hex("d92626"))
    }),
    test("complement with hex", () => {
      assertEqual(#hex("ff0000")->complement, #hex("0ff"))
    }),
    test("adjustHue with hex", () => {
      assertEqual(#hex("ff0000")->adjustHue(~degree=0.3), #hex("ff0100"))
    }),
  ]
}

let utilsTests = () => {
  open Color.Utils

  [
    test("fromString with hex", () => {
      assertEqual("#ff0000"->fromString, #hex("ff0000"))
    }),
    test("fromString with rgba", () => {
      assertEqual("rgba(255, 0, 0, 0.5)"->fromString, #rgba(255, 0, 0, #num(0.5)))
    }),
  ]
}

let suites = [suite("Color", colorTests()), suite("Color.Utils", utilsTests())]
