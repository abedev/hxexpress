package mw;

import haxe.io.Bytes;
import haxe.crypto.Base64;
import express.Request;
import express.Response;
import express.Next;
#if (haxe_ver >= 4.0)
import js.lib.Error;
#else
import js.Error;
#end
import js.node.Buffer;
using StringTools;

class BasicAuth {
  static var BASIC = "Basic";
  static var AUTHORIZATION = "authorization";
  static var WWW_AUTHENTICATE = "WWW-Authenticate";
  static var REALM = "realm";

  public static function create(realm : String, authenticator : String -> String -> Request -> (Null<Error> -> Void) -> Void) : Request -> Response -> Next -> Void {
    return function (req : Request, res : Response, next : Next) : Void {
      if (!req.headers.exists(AUTHORIZATION)) {
        send401(res, realm);
        return;
      }

      var authorizationHeader : String = req.headers.get(AUTHORIZATION);
      if (authorizationHeader == null || authorizationHeader.trim() == "") {
        send401(res, realm);
        return;
      }

      var parts = authorizationHeader.split(" ").filter(function(part) {
        return part.trim() != "";
      });
      if (parts.length != 2) {
        send401(res, realm);
        return;
      }

      var type = parts[0];
      var base64 = parts[1];
      if (type != BASIC) {
        send401(res, realm);
        return;
      }

      if (base64 == "") {
        send401(res, realm);
        return;
      }

      var plainText = try Base64.decode(base64).toString() catch (e : Dynamic) null;
      if (plainText == null || plainText.trim() == "") {
        send401(res, realm);
        return;
      }

      var authParts = plainText.split(":");
      if (authParts.length != 2) {
        send401(res, realm);
        return;
      }

      var username = authParts[0];
      var password = authParts[1];
      authenticator(username, password, req, function(err) {
        if (err != null) {
          var message = err.message != null ? err.message : 'Failed to authenticate Basic credentials';
          send403(res, message);
          return;
        }
        next.call();
      });
    }
  }

  static function send401(res : Response, realm : String) : Void {
    res.setHeader(WWW_AUTHENTICATE, '$BASIC $REALM="$realm"');
    res.status(401).end();
  }

  static function send403(res : Response, message : String) : Void {
    res.status(403).send(message);
  }
}
