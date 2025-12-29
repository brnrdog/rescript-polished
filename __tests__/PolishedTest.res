open TestFramework
open Polished

let colorTests = () => {
  open Color

  [
    test("shade", () => {
      assertEqual("#ed5051"->shade(~amount=0.25), "#b13c3c")
    }),
    test("tint", () => {
      assertEqual("#ed5051"->tint(~amount=0.25), "#f17b7c")
    }),
    test("lighten", () => {
      assertEqual("#ed5051"->lighten(~amount=0.25), "#f9c4c4")
    }),
    test("darken", () => {
      assertEqual("#ed5051"->darken(~amount=0.25), "#ac1213")
    }),
    test("hsl", () => {
      assertEqual(hsl(~hue=30., ~saturation=0.5, ~lightness=0.3), "#734d26")
    }),
    test("adjustHue", () => {
      assertEqual("#ed5051"->adjustHue(~degree=30.5), "#ed9f50")
    }),
    test("complement", () => {
      assertEqual("#ed5051"->complement, "#50edec")
    }),
    test("desaturate", () => {
      assertEqual("#ed5051"->desaturate(~amount=25.5), "#9f9f9f")
    }),
    test("getContrast", () => {
      assertEqual("#ed5051"->getContrast("#fff"), 3.58)
    }),
    test("getLuminance", () => {
      assertEqual("#ed5051"->getLuminance, 0.243)
    }),
    test("grayscale", () => {
      assertEqual("#ed5051"->grayscale, "#9f9f9f")
    }),
    test("hsla", () => {
      assertEqual(
        hsla(~hue=130., ~saturation=0.25, ~lightness=0.5, ~alpha=0.5),
        "rgba(96,159,106,0.5)",
      )
    }),
    test("invert", () => {
      assertEqual("#ed5951"->invert, "#12a6ae")
    }),
    test("meetsContrastGuidelines", () => {
      let expected: contrastScores = {
        "AA": true,
        "AALarge": true,
        "AAA": true,
        "AAALarge": true,
      }
      assertEqual("#000000"->meetsContrastGuidelines("#ffffff"), expected)
    }),
    test("transparentize", () => {
      assertEqual("#ed5051"->transparentize(~amount=0.5), "rgba(237,80,81,0.5)")
    }),
    test("hslToColorString", () => {
      let hsl = {
        "hue": 240.,
        "lightness": 1.0,
        "saturation": 0.5,
      }
      assertEqual(hsl->hslToColorString, "#fff")
    }),
    test("mix", () => {
      assertEqual("#ed5051"->mix("#bc9090", ~weight=0.2), "#c58383")
    }),
    test("opacify", () => {
      assertEqual("#ed505100"->opacify(~amount=0.5), "rgba(237,80,81,0.5)")
    }),
    test("parseToHsl", () => {
      let expected: hslColor = {
        "hue": 0.0,
        "lightness": 0.5,
        "saturation": 1.0,
      }
      assertEqual("#FF0000"->parseToHsl, expected)
    }),
    test("parseToRgb", () => {
      let expected: rgbColor = {
        "red": 237,
        "green": 80,
        "blue": 81,
      }
      assertEqual("#ed5051"->parseToRgb, expected)
    }),
    test("readableColor", () => {
      combineResults([
        assertEqual("#ed5051"->readableColor(~strict=false, ()), "#fff"),
        assertEqual("#000"->readableColor(), "#000"),
        assertEqual("black"->readableColor(~darkReturnColor="#ff8", ()), "#ff8"),
        assertEqual("white"->readableColor(~lightReturnColor="#001", ()), "#001"),
        assertEqual(
          "red"->readableColor(
            ~lightReturnColor="#333",
            ~darkReturnColor="#ddd",
            ~strict=true,
            (),
          ),
          "#000",
        ),
        assertEqual(
          "yellow"->readableColor(
            ~lightReturnColor="#333",
            ~darkReturnColor="#ddd",
            ~strict=true,
            (),
          ),
          "#333",
        ),
        assertEqual(
          "blue"->readableColor(
            ~lightReturnColor="#333",
            ~darkReturnColor="#ddd",
            ~strict=true,
            (),
          ),
          "#ddd",
        ),
      ])
    }),
    test("rgb", () => {
      let subject: rgbColor = {
        "red": 255,
        "green": 255,
        "blue": 255,
      }
      assertEqual(subject->rgb, "#fff")
    }),
    test("rgba", () => {
      let subject: rgbaColor = {
        "red": 255,
        "green": 205,
        "blue": 100,
        "alpha": 0.7,
      }
      assertEqual(subject->rgba, "rgba(255,205,100,0.7)")
    }),
    test("saturate", () => {
      assertEqual("#ed5051"->saturate(~amount=0.5), "#ff3e3f")
    }),
    test("setHue", () => {
      assertEqual("#CCCD64"->setHue(~hue=42), "#cdae64")
    }),
    test("setLightness", () => {
      assertEqual("#CCCD64"->setLightness(~lightness=0.2), "#4d4d19")
    }),
    test("setSaturation", () => {
      assertEqual("#CCCD64"->setSaturation(~saturation=0.2), "#adad84")
    }),
  ]
}

let mathTests = () => {
  open Math

  [
    test("math", () => {
      combineResults([
        assertEqual("12px + 8px"->math(), "20px"),
        assertEqual("12rem + 8rem"->math(), "20rem"),
        {
          let result = try {
            let _ = math("10px + 8rem", ())
            Fail("Expected exception to be thrown")
          } catch {
          | _ => Pass
          }
          result
        },
      ])
    }),
  ]
}

let mixinTests = () => {
  open Mixins

  [
    test("between", () => {
      let result = between(
        ~fromSize=Size.makeString("16px"),
        ~toSize=Size.makeString("100px"),
        ~minScreen="400px",
        ~maxScreen="1000px",
        (),
      )
      assertTrue(result != "", ~message="between should return non-empty string")
    }),
    test("clearfix", () => {
      let result = clearFix(~parent="div")
      assertTrue(result != "", ~message="clearFix should return non-empty string")
    }),
    test("cover", () => {
      let result = cover(~offset=Size.makeString("16px"), ())
      assertTrue(result != "", ~message="cover should return non-empty string")
    }),
    test("ellipsis", () => {
      let result = ellipsis(~width=Size.makeString("16px"), ~lines=10, ())
      assertTrue(result != "", ~message="ellipsis should return non-empty string")
    }),
    test("fluidRange", () => {
      let result =
        {
          prop: "padding",
          fromSize: Size.makeString("20px"),
          toSize: Size.makeString("20px"),
        }->fluidRange(~minScreen="320px", ~maxScreen="1024px")
      assertTrue(result != "", ~message="fluidRange should return non-empty string")
    }),
    test("fluidRangeWithArray", () => {
      let result =
        [
          {
            prop: "padding",
            fromSize: Size.makeString("16px"),
            toSize: Size.makeString("32px"),
          },
          {
            prop: "margin",
            fromSize: Size.makeString("16px"),
            toSize: Size.makeString("32px"),
          },
        ]->fluidRangeWithArray(~minScreen="320px", ~maxScreen="1024px")
      assertTrue(result != "", ~message="fluidRangeWithArray should return non-empty string")
    }),
  ]
}

let suites = [
  suite("Color", colorTests()),
  suite("Math", mathTests()),
  suite("Mixins", mixinTests()),
]
