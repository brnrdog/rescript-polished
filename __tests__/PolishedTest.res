open Jest
open Expect
open Polished

let keepGoing = _ => ()

describe("Color", () => {
  open Color

  test("shade", () => {
    "#ed5051"->shade(~amount=0.25)->expect |> toBe("#b13c3c")
  })

  test("tint", () => {
    "#ed5051"->tint(~amount=0.25)->expect |> toBe("#f17b7c")
  })

  test("lighten", () => {
    "#ed5051"->lighten(~amount=0.25)->expect |> toBe("#f9c4c4")
  })

  test("darken", () => {
    "#ed5051"->darken(~amount=0.25)->expect |> toBe("#ac1213")
  })

  test("hsl", () => {
    hsl(~hue=30., ~saturation=0.5, ~lightness=0.3)->expect |> toBe("#734d26")
  })

  test("adjustHue", () => {
    "#ed5051"->adjustHue(~degree=30.5)->expect |> toBe("#ed9f50")
  })

  test("complement", () => {
    "#ed5051"->complement->expect |> toBe("#50edec")
  })

  test("desaturate", () => {
    "#ed5051"->desaturate(~amount=25.5)->expect |> toBe("#9f9f9f")
  })

  test("getContrast", () => {
    "#ed5051"->getContrast("#fff")->expect |> toBe(3.58)
  })

  test("getLuminance", () => {
    "#ed5051"->getLuminance->expect |> toBe(0.243)
  })

  test("grayscale", () => {
    "#ed5051"->grayscale->expect |> toBe("#9f9f9f")
  })

  test("hsla", () => {
    hsla(~hue=130., ~saturation=0.25, ~lightness=0.5, ~alpha=0.5)->expect
      |> toBe("rgba(96,159,106,0.5)")
  })

  test("invert", () => {
    "#ed5951"->invert->expect |> toBe("#12a6ae")
  })

  test("meetsContrastGuidelines", () => {
    let expected: contrastScores = {
      "AA": true,
      "AALarge": true,
      "AAA": true,
      "AAALarge": true,
    }

    "#000000"->meetsContrastGuidelines("#ffffff")->expect |> toEqual(expected)
  })

  test("transparentize", () => {
    "#ed5051"->transparentize(~amount=0.5)->expect |> toBe("rgba(237,80,81,0.5)")
  })

  test("hslToColorString", () => {
    let hsl = {
      "hue": 240.,
      "lightness": 1.0,
      "saturation": 0.5,
    }

    hsl->hslToColorString->expect |> toBe("#fff")
  })

  test("mix", () => {
    "#ed5051"->mix("#bc9090", ~weight=0.2)->expect |> toBe("#c58383")
  })

  test("opacify", () => {
    "#ed505100"->opacify(~amount=0.5)->expect |> toBe("rgba(237,80,81,0.5)")
  })

  test("parseToHsl", () => {
    let expected: hslColor = {
      "hue": 0.0,
      "lightness": 0.5,
      "saturation": 1.0,
    }

    "#FF0000"->parseToHsl->expect |> toEqual(expected)
  })

  test("parseToRgb", () => {
    let expected: rgbColor = {
      "red": 237,
      "green": 80,
      "blue": 81,
    }

    "#ed5051"->parseToRgb->expect |> toEqual(expected)
  })

  test("readableColor", () => {
    "#ed5051"->readableColor(~strict=false, ())->expect |> toBe("#fff") |> keepGoing

    "#000"->readableColor()->expect |> toBe("#000") |> keepGoing

    "black"->readableColor(~darkReturnColor="#ff8", ())->expect |> toBe("#ff8") |> keepGoing

    "white"->readableColor(~lightReturnColor="#001", ())->expect |> toBe("#001") |> keepGoing

    "red"
    ->readableColor(~lightReturnColor="#333", ~darkReturnColor="#ddd", ~strict=true, ())
    ->expect
    |> toBe("#000")
    |> keepGoing

    "yellow"
    ->readableColor(~lightReturnColor="#333", ~darkReturnColor="#ddd", ~strict=true, ())
    ->expect
    |> toBe("#333")
    |> keepGoing

    "blue"
    ->readableColor(~lightReturnColor="#333", ~darkReturnColor="#ddd", ~strict=true, ())
    ->expect |> toBe("#ddd")
  })

  test("rgb", () => {
    let subject: rgbColor = {
      "red": 255,
      "green": 255,
      "blue": 255,
    }

    subject->rgb->expect |> toBe("#fff")
  })

  test("rgba", () => {
    let subject: rgbaColor = {
      "red": 255,
      "green": 205,
      "blue": 100,
      "alpha": 0.7,
    }

    subject->rgba->expect |> toBe("rgba(255,205,100,0.7)")
  })

  test("saturate", () => {
    "#ed5051"->saturate(~amount=0.5)->expect |> toBe("#ff3e3f")
  })

  test("setHue", () => {
    "#CCCD64"->setHue(~hue=42)->expect |> toBe("#cdae64")
  })

  test("setLightness", () => {
    "#CCCD64"->setLightness(~lightness=0.2)->expect |> toBe("#4d4d19")
  })

  test("setSaturation", () => {
    "#CCCD64"->setSaturation(~saturation=0.2)->expect |> toBe("#adad84")
  })
})

describe("Math", () => {
  open Math

  test("math", () => {
    "12px + 8px"->math()->expect |> toBe("20px") |> keepGoing

    "12rem + 8rem"->math()->expect |> toBe("20rem") |> keepGoing

    math("10px + 8rem")->expect |> toThrow
  })
})

describe("Mixins", () => {
  open Mixins

  test("between", () => {
    between(
      ~fromSize=Size.makeString("16px"),
      ~toSize=Size.makeString("100px"),
      ~minScreen="400px",
      ~maxScreen="1000px",
      (),
    )->expect |> toMatchSnapshot
  })

  test("clearfix", () => {
    clearFix(~parent="div")->expect |> toMatchSnapshot
  })

  test("cover", () => {
    cover(~offset=Size.makeString("16px"), ())->expect |> toMatchSnapshot
  })

  test("ellipsis", () => {
    ellipsis(~width=Size.makeString("16px"), ~lines=10, ())->expect |> toMatchSnapshot
  })

  test("fluidRange", () => {
    {
      prop: "padding",
      fromSize: Size.makeString("20px"),
      toSize: Size.makeString("20px"),
    }
    ->fluidRange(~minScreen="320px", ~maxScreen="1024px")
    ->expect
    ->toMatchSnapshot
  })

  test("fluidRangeWithArray", () => {
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
    ]
    ->fluidRangeWithArray(~minScreen="320px", ~maxScreen="1024px")
    ->expect
    ->toMatchSnapshot
  })
})
