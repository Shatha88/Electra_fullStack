// ignore_for_file: file_names

import 'dart:convert';
// import 'dart:js_interop';

import 'package:shelf/shelf.dart';

import '../../RespnseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

loginResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    if (body["email"] == null || body["password"] == null) {
      return Response.badRequest(body: "add email and password please");
    }
    final auth = SupabaseEnv().supabase.auth;
    final userLogin = await auth.signInWithPassword(
      email: body["email"],
      password: body["password"],
    );

    String userType = "CONSUMER";
    final supabase = SupabaseEnv().supabase;
    List result =
        await supabase.from("providers").select().eq("email", body['email']);

    final List iduser = result;
    if (iduser.isNotEmpty) {
      userType = "PROVIDER";
    } else {
      result =
          await supabase.from("consumers").select().eq("email", body['email']);
    }
    // return Response.ok(userLogin.session?.accessToken.toString());
    return CustomResponse().successResponse(msg: "success", data: {
      "token": userLogin.session?.accessToken.toString(),
      'UserType': userType,
      'profile': result,
    });
  } catch (error) {
    return CustomResponse().errorResponse(msg: error.toString());
  }
}
