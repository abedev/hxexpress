package mw;

import express.Middleware;
import mw.compression.*;

@:jsRequire("compression")
extern class Compression {
  @:selfCall static function create(?options : CompressionOptions) : Middleware;
}
