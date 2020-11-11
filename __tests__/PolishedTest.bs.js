// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var Polished = require("../src/Polished.bs.js");

Jest.test("shade", (function (param) {
        return Jest.Expect.toBe("#b13c3c", Jest.Expect.expect(Polished.shade("#ed5051", 0.25)));
      }));

Jest.test("tint", (function (param) {
        return Jest.Expect.toBe("#f17b7c", Jest.Expect.expect(Polished.tint("#ed5051", 0.25)));
      }));

Jest.test("lighten", (function (param) {
        return Jest.Expect.toBe("#f9c4c4", Jest.Expect.expect(Polished.lighten("#ed5051", 0.25)));
      }));

Jest.test("darken", (function (param) {
        return Jest.Expect.toBe("#ac1213", Jest.Expect.expect(Polished.darken("#ed5051", 0.25)));
      }));

Jest.test("hsl", (function (param) {
        return Jest.Expect.toBe("#734d26", Jest.Expect.expect(Polished.hsl(30, 0.5, 0.3)));
      }));

Jest.test("adjustHue", (function (param) {
        return Jest.Expect.toBe("#ed9f50", Jest.Expect.expect(Polished.adjustHue("#ed5051", 30.5)));
      }));

Jest.test("complement", (function (param) {
        return Jest.Expect.toBe("#50edec", Jest.Expect.expect(Polished.complement("#ed5051")));
      }));

Jest.test("desaturate", (function (param) {
        return Jest.Expect.toBe("#9f9f9f", Jest.Expect.expect(Polished.desaturate("#ed5051", 25.5)));
      }));

Jest.test("getContrast", (function (param) {
        return Jest.Expect.toBe(3.58, Jest.Expect.expect(Polished.getContrast("#ed5051", "#ffffff")));
      }));

Jest.test("getLuminance", (function (param) {
        return Jest.Expect.toBe(0.243, Jest.Expect.expect(Polished.getLuminance("#ed5051")));
      }));

Jest.test("grayscale", (function (param) {
        return Jest.Expect.toBe("#9f9f9f", Jest.Expect.expect(Polished.grayscale("#ed5051")));
      }));

Jest.test("hsla", (function (param) {
        return Jest.Expect.toBe("rgba(96,159,106,0.5)", Jest.Expect.expect(Polished.hsla(130, 0.25, 0.5, 0.5)));
      }));

Jest.test("invert", (function (param) {
        return Jest.Expect.toBe("#12a6ae", Jest.Expect.expect(Polished.invert("#ed5951")));
      }));

Jest.test("meetsContrastGuidelines: true", (function (param) {
        var expected = {
          AA: true,
          AALarge: true,
          AAA: true,
          AAALarge: true
        };
        return Jest.Expect.toEqual(expected, Jest.Expect.expect(Polished.meetsContrastGuidelines("#000000", "#ffffff")));
      }));

Jest.test("transparentize", (function (param) {
        return Jest.Expect.toBe("rgba(237,80,81,0.5)", Jest.Expect.expect(Polished.transparentize("#ed5051", 0.5)));
      }));

Jest.test("hslToColorString", (function (param) {
        return Jest.Expect.toBe("#356020", Jest.Expect.expect(Polished.hslToColorString({
                            hue: 100.0,
                            saturation: 0.5,
                            lightness: 0.25
                          })));
      }));

/*  Not a pure module */