open Jest
open Expect;
open Polished;

let keepGoing = _ => ()

test("shade", () => {
  "#ed5051"
  -> Color.shade(~amount=0.25)
  -> expect
  |> toBe("#b13c3c")
})

test("tint", () => {
  "#ed5051"
  -> Color.tint(~amount=0.25)
  -> expect
  |> toBe("#f17b7c")
})

test("lighten", () => {
  "#ed5051"
  -> Color.lighten(~amount=0.25)
  -> expect
  |> toBe("#f9c4c4")
})

test("darken", () => {
  "#ed5051"
  -> Color.darken(~amount=0.25)
  -> expect
  |> toBe("#ac1213")
})

test("hsl", () => {
  Color.hsl(~hue=30., ~saturation=0.5, ~lightness=0.3)
  -> expect
  |> toBe("#734d26")
})

test("adjustHue", () => {
  "#ed5051"
  -> Color.adjustHue(~degree=30.5)
  -> expect
  |> toBe("#ed9f50")
})

test("complement", () => {
  "#ed5051"
  -> Color.complement
  -> expect
  |> toBe("#50edec")
})

test("desaturate", () => {
  "#ed5051"
  -> Color.desaturate(~amount=25.5)
  -> expect
  |> toBe("#9f9f9f")
})

test("getContrast", () => {
  "#ed5051"
  -> Color.getContrast("#ffffff")
  -> expect
  |> toBe(3.58)
})

test("getLuminance", () => {
  "#ed5051"
  -> Color.getLuminance
  -> expect
  |> toBe(0.243)
})

test("grayscale", () => {
  "#ed5051"
  -> Color.grayscale
  -> expect
  |> toBe("#9f9f9f")
})

test("hsla", () => {
  -> Color.hsla(~hue=130., ~saturation=0.25, ~lightness=0.5, ~alpha=0.5)
  -> expect
  |> toBe("rgba(96,159,106,0.5)")
})

test("invert", () => {
  "#ed5951"
  -> Color.invert
  -> expect
  |> toBe("#12a6ae")
})

test("meetsContrastGuidelines", () => {
  let expected: Color.contrastScores = {
    "AA": true,
    "AALarge": true,
    "AAA": true,
    "AAALarge": true
  }

  ("#000000")
  -> Color.meetsContrastGuidelines("#ffffff")
  -> expect
  |> toEqual(expected)
})

test("transparentize", () => {
  "#ed5051"
  -> Color.transparentize(~amount=0.5)
  -> expect
  |> toBe("rgba(237,80,81,0.5)")
})

test("hslToColorString", () => {
  let hsl = {
    "hue": 240.,
    "lightness": 1.0,
    "saturation": 0.5,
  }

  hsl
  -> Color.hslToColorString
  -> expect
  |> toBe("#ed5051")
})

test("mix", () => {
  "#ed5051"
  -> Color.mix("#bc9090", ~weight=0.2)
  -> expect
  |> toBe("#c58383")
})

test("opacify", () => {
  "#ed505100"
  -> Color.opacify(~amount=0.5)
  -> expect
  |> toBe("rgba(237,80,81,0.5)")
})

test("parseToHsl", () => {
  let expected: Color.hslColor = {
    "hue": 255.,
    "lightness": 0.,
    "saturation": 0.,
  }

  "#ed5051"
  -> Color.parseToHsl
  -> expect
  |> toEqual(expected)
})

test("parseToRgb", () => {
  let expected: Color.rgbColor = {
    "red": 237,
    "green": 80,
    "blue": 81
  }

  "#ed5051"
  -> Color.parseToRgb
  -> expect
  |> toEqual(expected)
})

test("readableColor", () => {
  "#ed5051"
  -> Color.readableColor(~strict=false, ())
  -> expect
  |> toBe("#fff")
  |> keepGoing

  "#000"
  -> Color.readableColor(())
  -> expect
  |> toBe("#000")
  |> keepGoing

  "black"
  -> Color.readableColor(~darkReturnColor="#ff8", ())
  -> expect
  |> toBe("#ff8")
  |> keepGoing

  "white"
  -> Color.readableColor(~lightReturnColor="#001", ())
  -> expect
  |> toBe("#001")
  |> keepGoing

  "red"
  -> Color.readableColor(
    ~lightReturnColor = "#333",
    ~darkReturnColor = "#ddd",
    ~strict = true,
    ()
  )
  -> expect
  |> toBe("#000")
  |> keepGoing

  "yellow"
  -> Color.readableColor(
    ~lightReturnColor = "#333",
    ~darkReturnColor = "#ddd",
    ~strict = true,
    ()
  )
  -> expect
  |> toBe("#333")
  |> keepGoing

  "blue"
  -> Color.readableColor(
    ~lightReturnColor = "#333",
    ~darkReturnColor = "#ddd",
    ~strict = true,
    ()
  )
  -> expect
  |> toBe("#ddd")
})

test("rgb", () => {
  let rgb: Color.rgbColor = {
    "red": 255,
    "green": 255,
    "blue": 255
  }

  rgb
  -> Color.rgb
  -> expect
  |> toBe("#fff")
})

test("rgba", () => {
  let rgba: Color.rgbaColor = {
    "red": 255,
    "green": 205,
    "blue": 100,
    "alpha": 0.7
  }

  rgba
  -> Color.rgba
  -> expect
  |> toBe("rgba(255,205,100,0.7)")
})

test("saturate", () => {
  "#ed5051"
  -> Color.saturate(~amount=0.5)
  -> expect
  |> toBe("#ff3e3f")
})