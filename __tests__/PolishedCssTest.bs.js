// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var PolishedCss__Color = require("../src/PolishedCss__Color.bs.js");

function toEqual(x, y) {
  return Jest.Expect.toEqual(y, x);
}

Jest.describe("Color", (function (param) {
        Jest.test("shade", (function (param) {
                var x = Jest.Expect.expect(PolishedCss__Color.shade("#ff0000", 0.25));
                return Jest.Expect.toEqual({
                            NAME: "hex",
                            VAL: "bf000"
                          }, x);
              }));
        Jest.test("tint", (function (param) {
                var x = Jest.Expect.expect(PolishedCss__Color.tint("#ff0000", 0.25));
                return Jest.Expect.toEqual({
                            NAME: "hex",
                            VAL: "ff3f3"
                          }, x);
              }));
        Jest.test("darken", (function (param) {
                var x = Jest.Expect.expect(PolishedCss__Color.darken("#ff0000", 0.25));
                return Jest.Expect.toEqual({
                            NAME: "hex",
                            VAL: "80000"
                          }, x);
              }));
        Jest.test("lighten", (function (param) {
                var x = Jest.Expect.expect(PolishedCss__Color.lighten("#ff0000", 0.25));
                return Jest.Expect.toEqual({
                            NAME: "hex",
                            VAL: "ff808"
                          }, x);
              }));
        return Jest.test("transparentize", (function (param) {
                      var y = PolishedCss__Color.Rgba.fromString("rgba(255, 0, 0, 0.5)");
                      var x = Jest.Expect.expect(PolishedCss__Color.transparentize("#ff0000", 0.5));
                      return Jest.Expect.toEqual(y, x);
                    }));
      }));

exports.toEqual = toEqual;
/*  Not a pure module */
