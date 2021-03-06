// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/lib/js/src/jest.js");
var Caml_option = require("bs-platform/lib/js/caml_option.js");
var Polished__Math = require("../src/Polished__Math.js");
var Polished__Color = require("../src/Polished__Color.js");
var Polished__Mixins = require("../src/Polished__Mixins.js");

function keepGoing(param) {
  
}

Jest.describe("Color", (function (param) {
        Jest.test("shade", (function (param) {
                return Jest.Expect.toBe("#b13c3c", Jest.Expect.expect(Polished__Color.shade("#ed5051", 0.25)));
              }));
        Jest.test("tint", (function (param) {
                return Jest.Expect.toBe("#f17b7c", Jest.Expect.expect(Polished__Color.tint("#ed5051", 0.25)));
              }));
        Jest.test("lighten", (function (param) {
                return Jest.Expect.toBe("#f9c4c4", Jest.Expect.expect(Polished__Color.lighten("#ed5051", 0.25)));
              }));
        Jest.test("darken", (function (param) {
                return Jest.Expect.toBe("#ac1213", Jest.Expect.expect(Polished__Color.darken("#ed5051", 0.25)));
              }));
        Jest.test("hsl", (function (param) {
                return Jest.Expect.toBe("#734d26", Jest.Expect.expect(Polished__Color.hsl(30, 0.5, 0.3)));
              }));
        Jest.test("adjustHue", (function (param) {
                return Jest.Expect.toBe("#ed9f50", Jest.Expect.expect(Polished__Color.adjustHue("#ed5051", 30.5)));
              }));
        Jest.test("complement", (function (param) {
                return Jest.Expect.toBe("#50edec", Jest.Expect.expect(Polished__Color.complement("#ed5051")));
              }));
        Jest.test("desaturate", (function (param) {
                return Jest.Expect.toBe("#9f9f9f", Jest.Expect.expect(Polished__Color.desaturate("#ed5051", 25.5)));
              }));
        Jest.test("getContrast", (function (param) {
                return Jest.Expect.toBe(3.58, Jest.Expect.expect(Polished__Color.getContrast("#ed5051", "#fff")));
              }));
        Jest.test("getLuminance", (function (param) {
                return Jest.Expect.toBe(0.243, Jest.Expect.expect(Polished__Color.getLuminance("#ed5051")));
              }));
        Jest.test("grayscale", (function (param) {
                return Jest.Expect.toBe("#9f9f9f", Jest.Expect.expect(Polished__Color.grayscale("#ed5051")));
              }));
        Jest.test("hsla", (function (param) {
                return Jest.Expect.toBe("rgba(96,159,106,0.5)", Jest.Expect.expect(Polished__Color.hsla(130, 0.25, 0.5, 0.5)));
              }));
        Jest.test("invert", (function (param) {
                return Jest.Expect.toBe("#12a6ae", Jest.Expect.expect(Polished__Color.invert("#ed5951")));
              }));
        Jest.test("meetsContrastGuidelines", (function (param) {
                var expected = {
                  AA: true,
                  AALarge: true,
                  AAA: true,
                  AAALarge: true
                };
                return Jest.Expect.toEqual(expected, Jest.Expect.expect(Polished__Color.meetsContrastGuidelines("#000000", "#ffffff")));
              }));
        Jest.test("transparentize", (function (param) {
                return Jest.Expect.toBe("rgba(237,80,81,0.5)", Jest.Expect.expect(Polished__Color.transparentize("#ed5051", 0.5)));
              }));
        Jest.test("hslToColorString", (function (param) {
                var hsl = {
                  hue: 240,
                  lightness: 1.0,
                  saturation: 0.5
                };
                return Jest.Expect.toBe("#fff", Jest.Expect.expect(Polished__Color.hslToColorString(hsl)));
              }));
        Jest.test("mix", (function (param) {
                return Jest.Expect.toBe("#c58383", Jest.Expect.expect(Polished__Color.mix("#ed5051", "#bc9090", 0.2)));
              }));
        Jest.test("opacify", (function (param) {
                return Jest.Expect.toBe("rgba(237,80,81,0.5)", Jest.Expect.expect(Polished__Color.opacify("#ed505100", 0.5)));
              }));
        Jest.test("parseToHsl", (function (param) {
                var expected = {
                  hue: 0.0,
                  lightness: 0.5,
                  saturation: 1.0
                };
                return Jest.Expect.toEqual(expected, Jest.Expect.expect(Polished__Color.parseToHsl("#FF0000")));
              }));
        Jest.test("parseToRgb", (function (param) {
                var expected = {
                  red: 237,
                  green: 80,
                  blue: 81
                };
                return Jest.Expect.toEqual(expected, Jest.Expect.expect(Polished__Color.parseToRgb("#ed5051")));
              }));
        Jest.test("readableColor", (function (param) {
                Jest.Expect.toBe("#fff", Jest.Expect.expect(Polished__Color.readableColor("#ed5051", undefined, undefined, false, undefined)));
                Jest.Expect.toBe("#000", Jest.Expect.expect(Polished__Color.readableColor("#000", undefined, undefined, undefined, undefined)));
                Jest.Expect.toBe("#ff8", Jest.Expect.expect(Polished__Color.readableColor("black", undefined, "#ff8", undefined, undefined)));
                Jest.Expect.toBe("#001", Jest.Expect.expect(Polished__Color.readableColor("white", "#001", undefined, undefined, undefined)));
                Jest.Expect.toBe("#000", Jest.Expect.expect(Polished__Color.readableColor("red", "#333", "#ddd", true, undefined)));
                Jest.Expect.toBe("#333", Jest.Expect.expect(Polished__Color.readableColor("yellow", "#333", "#ddd", true, undefined)));
                return Jest.Expect.toBe("#ddd", Jest.Expect.expect(Polished__Color.readableColor("blue", "#333", "#ddd", true, undefined)));
              }));
        Jest.test("rgb", (function (param) {
                var subject = {
                  red: 255,
                  green: 255,
                  blue: 255
                };
                return Jest.Expect.toBe("#fff", Jest.Expect.expect(Polished__Color.rgb(subject)));
              }));
        Jest.test("rgba", (function (param) {
                var subject = {
                  red: 255,
                  green: 205,
                  blue: 100,
                  alpha: 0.7
                };
                return Jest.Expect.toBe("rgba(255,205,100,0.7)", Jest.Expect.expect(Polished__Color.rgba(subject)));
              }));
        Jest.test("saturate", (function (param) {
                return Jest.Expect.toBe("#ff3e3f", Jest.Expect.expect(Polished__Color.saturate("#ed5051", 0.5)));
              }));
        Jest.test("setHue", (function (param) {
                return Jest.Expect.toBe("#cdae64", Jest.Expect.expect(Polished__Color.setHue("#CCCD64", 42)));
              }));
        Jest.test("setLightness", (function (param) {
                return Jest.Expect.toBe("#4d4d19", Jest.Expect.expect(Polished__Color.setLightness("#CCCD64", 0.2)));
              }));
        return Jest.test("setSaturation", (function (param) {
                      return Jest.Expect.toBe("#adad84", Jest.Expect.expect(Polished__Color.setSaturation("#CCCD64", 0.2)));
                    }));
      }));

Jest.describe("Math", (function (param) {
        return Jest.test("math", (function (param) {
                      Jest.Expect.toBe("20px", Jest.Expect.expect(Polished__Math.math("12px + 8px", undefined)));
                      Jest.Expect.toBe("20rem", Jest.Expect.expect(Polished__Math.math("12rem + 8rem", undefined)));
                      return Jest.Expect.toThrow(Jest.Expect.expect(function (param) {
                                      return Polished__Math.math("10px + 8rem", param);
                                    }));
                    }));
      }));

Jest.describe("Mixins", (function (param) {
        Jest.test("between", (function (param) {
                return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.between("400px", "1000px", Polished__Mixins.Size.makeString("16px"), Polished__Mixins.Size.makeString("100px"), undefined)));
              }));
        Jest.test("clearfix", (function (param) {
                return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.clearFix("div")));
              }));
        Jest.test("cover", (function (param) {
                return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.cover(Caml_option.some(Polished__Mixins.Size.makeString("16px")), undefined)));
              }));
        Jest.test("ellipsis", (function (param) {
                return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.ellipsis(Caml_option.some(Polished__Mixins.Size.makeString("16px")), 10, undefined)));
              }));
        Jest.test("fluidRange", (function (param) {
                return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.fluidRange("320px", "1024px", {
                                    prop: "padding",
                                    fromSize: Polished__Mixins.Size.makeString("20px"),
                                    toSize: Polished__Mixins.Size.makeString("20px")
                                  })));
              }));
        return Jest.test("fluidRangeWithArray", (function (param) {
                      return Jest.Expect.toMatchSnapshot(Jest.Expect.expect(Polished__Mixins.fluidRangeWithArray("320px", "1024px", [
                                          {
                                            prop: "padding",
                                            fromSize: Polished__Mixins.Size.makeString("16px"),
                                            toSize: Polished__Mixins.Size.makeString("32px")
                                          },
                                          {
                                            prop: "margin",
                                            fromSize: Polished__Mixins.Size.makeString("16px"),
                                            toSize: Polished__Mixins.Size.makeString("32px")
                                          }
                                        ])));
                    }));
      }));

exports.keepGoing = keepGoing;
/*  Not a pure module */
