package mw;

import express.Request;
import express.Middleware;
import mw.cors.*;

@:jsRequire("cors")
extern class Cors {
  @:selfCall static function create(?options : Options) : Middleware;
}