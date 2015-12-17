package mw;

import express.Request;
import express.Response;
import express.Next;
import js.Error;
using StringTools;

class BearerTokenAuth {
  static var AUTHORIZATION = "authorization";
  static var BEARER = "Bearer";

  public static function create(authenticator : String -> Request -> (Null<Error> -> Void) -> Void) : Request -> Response -> Next -> Void {
    return function (req : Request, res : Response, next : Next) : Void {
      if (!req.headers.exists(AUTHORIZATION)) {
        send401(res, '$AUTHORIZATION header is required');
        return;
      }

      var authorizationHeader = req.headers[AUTHORIZATION];
      if (authorizationHeader == null || authorizationHeader.trim() == "") {
        send401(res, '"$AUTHORIZATION header has no value');
        return;
      }

      var parts = authorizationHeader.split(" ").filter(function(part) {
        return part.trim() != "";
      });
      if (parts.length != 2) {
        send401(res, '$AUTHORIZATION header value must be of the form "Bearer {token}"');
        return;
      }

      var type = parts[0].trim();
      var token = parts[1].trim();
      if (type != BEARER) {
        send401(res, '$AUTHORIZATION header has wrong type: $type');
        return;
      }

      if (token == "") {
        send401(res, '$AUTHORIZATION: $BEARER header has no token');
        return;
      }

      authenticator(token, req, function(err) {
        if (err != null) {
          send403(res, 'Failed to authenticate Bearer token');
          return;
        }
        next.call();
      });
    }
  }

  static function send401(res : Response, message : String) : Void {
    res.status(401).send(message);
  }

  static function send403(res : Response, message : String) : Void {
    res.status(403).send(message);
  }
}
