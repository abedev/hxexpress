package mw;

import express.Middleware;
import haxe.EitherType;
import mw.jwt.*;

@:jsRequire("express-unless")
extern class Unless {
  @:selfCall static function unless(?options : UnlessOptions) : UnlessMiddleware;
}

typedef UnlessOptions = {
  ?method : EitherType<String, Array<String>>,
  ?path : EitherType<String, Array<String>>, // TODO should also support REGEX
  ?ext : EitherType<String, Array<String>>,
  ?custom : Request -> Bool,
  ?useOriginalUrl : Bool
}

typedef UnlessMiddleware = EitherType<Middleware, Unless>;
