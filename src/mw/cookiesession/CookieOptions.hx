package mw.cookiesession;

import express.Request;
import express.Response;

typedef CookieOptions = {
  ?maxAge : Float,
  ?expires : Date,
  ?path : String,
  ?domain : String,
  ?secure : Bool,
  ?secureProxy : Bool,
  ?httpOnly : Bool,
  ?signed : Bool,
  ?overwrite : Bool
}
