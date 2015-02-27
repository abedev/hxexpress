package mw;

import express.Middleware;
import mw.cookieparser.*;

@:jsRequire("cookie-parser")
extern class CookieParser {
  @:selfCall static function create(?secret : String, ?options : { ?decode : String -> String }) : Middleware;
  static function JSONCookie(str : String) : Dynamic;
  static function JSONCookies(cookies : {}) : {};
  static function signedCookie(str : String, secret : String) : Dynamic;
  static function signedCookies(cookies : {}, secret : String) : {};
}
