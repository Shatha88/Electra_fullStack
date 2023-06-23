// ignore_for_file: file_names

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

deleteStationResponse(Request req, String id) async {
  final jwt = JWT.decode(req.headers["authorization"]!);

  //get provider id from table providers by id auth
  final supabase = SupabaseEnv().supabase;
  final listUser = await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", jwt.payload["sub"]);
  //delete station
  await supabase
      .from("stations")
      .delete()
      .eq("id_prov", listUser[0]["id"])
      .eq("id", int.parse(id));

  return Response.ok(jwt.payload["sub"]);
}
