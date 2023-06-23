// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Services/Supabase/supabaseEnv.dart';

changePasswordResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);
    if (body["email"] == null || body["password"] == null) {
      return Response.badRequest(body: "add email please");
    }

    final auth = SupabaseEnv().supabase.auth;
    final user = await auth.verifyOTP(
      token: body["code"],
      type: OtpType.recovery,
      email: body["email"],
    );

    if (user.session?.accessToken == null) {
      return Response.forbidden("faild to update password");
    }

    await auth.updateUser(
      UserAttributes(email: body["email"], password: body["password"]),
    );

    return Response.ok("password is update it");
  } on AuthException  {
    return Response.forbidden("body");
  } catch (error) {
    print(error);
    return Response.badRequest(body: error);
  }
  
}
