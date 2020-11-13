// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Polished = require("polished");

function shade(color, amount) {
  return Polished.shade(amount, color);
}

function tint(color, amount) {
  return Polished.tint(amount, color);
}

function lighten(color, amount) {
  return Polished.lighten(amount, color);
}

function darken(color, amount) {
  return Polished.darken(amount, color);
}

function hsl(hue, saturation, lightness) {
  return Polished.hsl(hue, saturation, lightness);
}

function adjustHue(color, degree) {
  return Polished.adjustHue(degree, color);
}

function complement(prim) {
  return Polished.complement(prim);
}

function desaturate(color, amount) {
  return Polished.desaturate(amount, color);
}

function getContrast(color1, color2) {
  return Polished.getContrast(color1, color2);
}

function getLuminance(prim) {
  return Polished.getLuminance(prim);
}

function grayscale(prim) {
  return Polished.grayscale(prim);
}

function hsla(hue, saturation, lightness, alpha) {
  return Polished.hsla(hue, saturation, lightness, alpha);
}

function invert(prim) {
  return Polished.invert(prim);
}

function meetsContrastGuidelines(prim, prim$1) {
  return Polished.meetsContrastGuidelines(prim, prim$1);
}

function transparentize(color, amount) {
  return Polished.transparentize(amount, color);
}

function hslToColorString(prim) {
  return Polished.hslToColorString(prim);
}

function mix(color1, color2, weight) {
  return Polished.mix(weight, color1, color2);
}

function opacify(color, amount) {
  return Polished.opacify(amount, color);
}

function parseToHsl(prim) {
  return Polished.parseToHsl(prim);
}

function parseToRgb(prim) {
  return Polished.parseToRgb(prim);
}

exports.shade = shade;
exports.tint = tint;
exports.lighten = lighten;
exports.darken = darken;
exports.hsl = hsl;
exports.adjustHue = adjustHue;
exports.complement = complement;
exports.desaturate = desaturate;
exports.getContrast = getContrast;
exports.getLuminance = getLuminance;
exports.grayscale = grayscale;
exports.hsla = hsla;
exports.invert = invert;
exports.meetsContrastGuidelines = meetsContrastGuidelines;
exports.transparentize = transparentize;
exports.hslToColorString = hslToColorString;
exports.mix = mix;
exports.opacify = opacify;
exports.parseToHsl = parseToHsl;
exports.parseToRgb = parseToRgb;
/* polished Not a pure module */
