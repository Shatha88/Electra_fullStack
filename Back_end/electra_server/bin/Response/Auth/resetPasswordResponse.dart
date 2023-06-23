// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../RespnseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

resetPasswordResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    if (body['email'] == null) {
      return Response.badRequest(
        body: json.encode({"msg": "missing email"}),
        headers: {'content-type': 'application/json'},
      );
    }
    await SupabaseEnv().supabase.auth.resetPasswordForEmail(body['email']);

    return CustomResponse().successResponse(
      msg: "check your email to get verify code",
      data: {"email": body['email']},
    );
  } catch (error) {
    return Response.badRequest(body: error.toString());
  }
}
