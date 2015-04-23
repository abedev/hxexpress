package mw;

import express.Middleware;
import mw.passport.*;

@:jsRequire("passport")
extern class Passport {
  @:selfCall function new() : Void;

  public function use(?name : String, strategy : Strategy<Dynamic>) : Passport;
  public function unuse(name : String) : Passport;
  // only for use outside of an Express context
  // public function framework(fw : Dynamic) : Passport
  public function initialize(?options : Dynamic) : Middleware;
  public function authenticate(strategy : String, ?options : Dynamic, callback : Dynamic) : Middleware;
  public function authorize(strategy : String, ?options : Dynamic, callback: Dynamic) : Middleware;
  public function session(?options : Dynamic) : Middleware;
  public function serializeUser(callback : Dynamic) : Void;
  public function deserializeUser(callback : Dynamic) : Void;
  public function transformAuthInfo(callback: Dynamic) : Void;
}
