// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../RespnseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

verificationEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await SupabaseEnv().supabase.auth.verifyOTP(
          token: body['otp'],
          type: OtpType.signup,
          email: body['email'],
        );

    return CustomResponse().successResponse(msg: "email is confirmed");
  } catch (error) {
    return CustomResponse().errorResponse(msg: "email not confirmed");
  }
}
