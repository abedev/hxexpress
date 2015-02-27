package mw;

import express.*;

@:jsRequire("express-uncapitalize")
extern class Uncapitalize {
  @:selfCall static function create() : Middleware;
}
