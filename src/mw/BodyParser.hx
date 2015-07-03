package mw;

import express.Middleware;
import mw.bodyparser.*;

@:jsRequire("body-parser")
extern class BodyParser {
  static function json(?options : JsonOptions) : Middleware;
  static function raw(?options : RawOptions) : Middleware;
  static function text(?options : TextOptions) : Middleware;
  static function urlencoded(?options : UrlEncodedOptions) : Middleware;
}
