// ignore_for_file: file_names

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

veiwStationDetalseResponse(Request request, String id) async {
  final jwt = JWT.decode(request.headers["authorization"]!);

  //get provider id from table providers by id auth
  final supabase = SupabaseEnv().supabase;
  final listUser = await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", jwt.payload["sub"]);
  //daisblay all stations data
  final station = await supabase
      .from("stations")
      .select()
      .eq("id_prov", listUser[0]["id"])
      .eq("id", int.parse(id));

  return Response.ok(
    json.encode(station),
    headers: {"content-type": "application/json"},
  );
}
