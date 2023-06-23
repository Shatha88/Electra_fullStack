// ignore_for_file: file_names

import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

// disblay id and level of stations
veiwStation(Request req) async {
  final jwt = JWT.decode(req.headers["authorization"]!);

  //get provider id from table providers by id auth
  final supabase = SupabaseEnv().supabase;
  // final result = await supabase
  //     .from("provider")
  //     .select("id")
  //     .eq("id_auth", jwt.payload["sub"]);

  // final idprov = result[0]["id"];

  final listUser = await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", jwt.payload["sub"]);

  final station = await supabase
      .from("stations")
      .select('*, station_time(id, from, to)')
      .eq("id_prov", listUser[0]["id"]);

  // display sations id and level
  // final station =
  //     (await supabase.from("station").select().eq("id_prov", idprov));

  return Response.ok(
    json.encode(station),
    headers: {"content-type": "application/json"},
  );
}
