// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

addStationResponse(Request req) async {
  // create body
  final body = json.decode(await req.readAsString());

  final jwt = JWT.decode(req.headers["authorization"]!);

  //get provider id from table providers by id auth
  final supabase = SupabaseEnv().supabase;
  final result = await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", jwt.payload["sub"]);

  final idprov = result[0]["id"];

  // create station
  await supabase.from("stations").upsert({"id_prov": idprov, ...body});

  return Response.ok("user provider ($idprov) whose station has been added");
}
