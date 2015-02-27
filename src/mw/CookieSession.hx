package mw;

import express.Middleware;
import mw.cookiesession.*;

@:jsRequire("cookie-session")
extern class CookieSession {
  @:selfCall static function create(?options : SessionOptions, ?cookieOptions : CookieOptions) : Middleware;
}
