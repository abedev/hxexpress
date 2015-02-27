package mw.compression;

import express.Request;
import express.Response;

typedef CompressionOptions = {
  ?chunkSize : Int,
  ?filter : Request -> Response -> Bool,
  ?level : Int,
  ?memLevel : Int,
  ?strategy : String,
  ?threshold : Dynamic, // TODO number bytes, bytes as string, `false`
  ?windowBits : Int
}
