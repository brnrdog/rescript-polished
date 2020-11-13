open Jest
open Expect;

test("shade", () => {
  "#ed5051"
  -> Polished.shade(~amount=0.25)
  -> expect
  |> toBe("#b13c3c")
})

test("tint", () => {
  "#ed5051"
  -> Polished.tint(~amount=0.25)
  -> expect
  |> toBe("#f17b7c")
})

test("lighten", () => {
  "#ed5051"
  -> Polished.lighten(~amount=0.25)
  -> expect
  |> toBe("#f9c4c4")
})

test("darken", () => {
  "#ed5051"
  -> Polished.darken(~amount=0.25)
  -> expect
  |> toBe("#ac1213")
})

test("hsl", () => {
  Polished.hsl(~hue=30, ~saturation=0.5, ~lightness=0.3)
  -> expect
  |> toBe("#734d26")
})

test("adjustHue", () => {
  "#ed5051"
  -> Polished.adjustHue(~degree=30.5)
  -> expect
  |> toBe("#ed9f50")
})

test("complement", () => {
  "#ed5051"
  -> Polished.complement
  -> expect
  |> toBe("#50edec")
})

test("desaturate", () => {
  "#ed5051"
  -> Polished.desaturate(~amount=25.5)
  -> expect
  |> toBe("#9f9f9f")
})

test("getContrast", () => {
  "#ed5051"
  -> Polished.getContrast("#ffffff")
  -> expect
  |> toBe(3.58)
})

test("getLuminance", () => {
  "#ed5051"
  -> Polished.getLuminance
  -> expect
  |> toBe(0.243)
})

test("grayscale", () => {
  "#ed5051"
  -> Polished.grayscale
  -> expect
  |> toBe("#9f9f9f")
})

test("hsla", () => {
  -> Polished.hsla(~hue=130, ~saturation=0.25, ~lightness=0.5, ~alpha=0.5)
  -> expect
  |> toBe("rgba(96,159,106,0.5)")
})

test("invert", () => {
  "#ed5951"
  -> Polished.invert
  -> expect
  |> toBe("#12a6ae")
})

test("meetsContrastGuidelines", () => {
  let expected: Polished.contrastScores = {
    "AA": true,
    "AALarge": true,
    "AAA": true,
    "AAALarge": true
  }

  ("#000000")
  -> Polished.meetsContrastGuidelines("#ffffff")
  -> expect
  |> toEqual(expected)
})

test("transparentize", () => {
  "#ed5051"
  -> Polished.transparentize(~amount=0.5)
  -> expect
  |> toBe("rgba(237,80,81,0.5)")
})

test("hslToColorString", () => {
  let hsl: Polished.hslColor = {
    "hue": 359.61783439490443,
    "lightness": 0.6215686274509804,
    "saturation": 0.8134715025906737,
  }

  hsl
  -> Polished.hslToColorString
  -> expect
  |> toBe("#ed5051")
})

test("mix", () => {
  "#ed5051"
  -> Polished.mix("#bc9090", ~weight=0.2)
  -> expect
  |> toBe("#c58383")
})

test("opacify", () => {
  "#ed505100"
  -> Polished.opacify(~amount=0.5)
  -> expect
  |> toBe("rgba(237,80,81,0.5)")
})

test("parseToHsl", () => {
  let expected: Polished.hslColor = {
    "hue": 359.61783439490443,
    "lightness": 0.6215686274509804,
    "saturation": 0.8134715025906737,
  }

  "#ed5051"
  -> Polished.parseToHsl
  -> expect
  |> toEqual(expected)
})
