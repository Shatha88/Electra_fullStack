// ignore_for_file: file_names

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../Services/Supabase/supabaseEnv.dart';

Middleware checkTokenMiddleware() => (innerhandler) => (Request req) {
      try {
        if (!req.headers.containsKey("authorization")) {
          return Response.forbidden("you need access for this endPoint");
        }
        final token = req.headers['authorization'].toString().trim();
        // Verify a token
        JWT.verify(
          token,
          SecretKey(
            SupabaseEnv().getJWT,
          ),
        );

        return innerhandler(req);
      } on JWTExpiredException {
        print('jwt expired');

        return Response.forbidden("token is Expired");
      } on JWTException catch (error) {
        print(error.message);

        return Response.forbidden("token not right");
        // ex: invalid signature
      } catch (error) {
        return Response.forbidden("you need access for this endPoint");
      }
    };
