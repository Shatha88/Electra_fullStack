// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../Services/Supabase/supabaseEnv.dart';

sendNewCodeSignUp(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    if (body["email"] == null) {
      return Response.badRequest(body: "add email please");
    }
    await SupabaseEnv().supabase.auth.signInWithOtp(email: body["email"]);

    return Response.ok("sendNewCodeSignUp");
  } catch (error) {
    return Response.badRequest();
  }
}
