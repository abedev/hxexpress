package mw;

import express.Request;
import express.Middleware;
import haxe.extern.EitherType;
#if (haxe_ver >= 4.0)
import js.lib.RegExp;
#else
import js.RegExp;
#end
import mw.jwt.*;

@:jsRequire("express-unless")
extern class Unless {
  @:selfCall static function create(?options : UnlessOptions) : UnlessMiddleware;
}

typedef UnlessOptions = {
  ?method : EitherType<String, Array<String>>,
  ?path : EitherType<String, EitherType<RegExp,Array<String>>>,
  ?ext : EitherType<String, Array<String>>,
  ?custom : Request -> Bool,
  ?useOriginalUrl : Bool
}

typedef UnlessMiddleware = EitherType<Middleware, Unless>;
