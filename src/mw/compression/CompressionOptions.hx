package mw.compression;

import express.Request;
import express.Response;
import haxe.extern.EitherType;

typedef CompressionOptions = {
  ?chunkSize : Int,
  ?filter : Request -> Response -> Bool,
  ?level : Int,
  ?memLevel : Int,
  ?strategy : String,
  ?threshold : EitherType<Int, EitherType<String, Bool>>,
  ?windowBits : Int
}
