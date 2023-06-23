// ignore_for_file: file_names

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../RespnseMsg/CustomResponse.dart';
import '../../../Services/Supabase/supabaseEnv.dart';

placeOrderResponse(Request req, String idProv) async {
  try {
    final body = json.decode(await req.readAsString());
    final jwt = JWT.decode(req.headers["authorization"]!);

    // get consumer id
    final supabase = SupabaseEnv().supabase;
    final result = await supabase
        .from("consumers")
        .select("id")
        .eq("id_auth", jwt.payload["sub"]);

    final iduser = result[0]["id"];

    // Add order
    await supabase
        .from("orders")
        .insert({"id_cons": iduser, "id_prov": idProv, ...body});

    return CustomResponse().successResponse(msg: 'order placed', data: body);
  } catch (error) {
    return CustomResponse().errorResponse(msg: error.toString());
  }
}
