package mw;

import express.Middleware;
import mw.passport.*;

@:jsRequire("passport")
extern class Passport {
  
  public static function use(?name : String, strategy : Strategy<Dynamic>) : Passport;
  public static function unuse(name : String) : Passport;
  // only for use outside of an Express context
  // public function framework(fw : Dynamic) : Passport
  public static  function initialize(?options : Dynamic) : Middleware;
  public static  function authenticate(strategy : String, ?options : Dynamic, callback : Dynamic) : Middleware;
  public static  function authorize(strategy : String, ?options : Dynamic, callback: Dynamic) : Middleware;
  public static  function session(?options : Dynamic) : Middleware;
  public static  function serializeUser(callback : Dynamic) : Void;
  public static  function deserializeUser(callback : Dynamic) : Void;
  public static  function transformAuthInfo(callback: Dynamic) : Void;
}
