// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/changePasswordResponse.dart';
import '../Response/Auth/createResponse.dart';
import '../Response/Auth/loginResponse.dart';
import '../Response/Auth/resetPasswordResponse.dart';
import '../Response/Auth/sendNewCodeResponse.dart';
import '../Response/Auth/verifyEmailResoponse.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/create_account', createResponse)
      ..post('/verification_email', verificationEmail)
      ..post("/reset_password", resetPasswordResponse)
      ..post("/send_code", sendNewCodeSignUp)
      ..post("/change_password", changePasswordResponse)
      ..post('/login', loginResponse);

    return router;
  }
}
