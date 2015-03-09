package mw;

import express.Request;
import express.Middleware;
import haxe.extern.EitherType;
import js.RegExp;
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
