// ignore_for_file: file_names

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../RespnseMsg/CustomResponse.dart';
import '../../../Services/Supabase/supabaseEnv.dart';

cancelOrderResponse(Request req, String id) async {
  try {
    final jwt = JWT.decode(req.headers['authorization']!);

    final supaBase = SupabaseEnv().supabase;
    final orderList = await supaBase
        .from("consumers")
        .select("id")
        .eq("id_auth", jwt.payload['sub']);

    final canceled = await supaBase
        .from("orders")
        .delete()
        .eq("id_cons", orderList[0]["id"])
        .eq("id", int.parse(id))
        .select();

    return CustomResponse()
        .successResponse(msg: 'order has been canceled', data: canceled);
  } catch (error) {
    return CustomResponse().errorResponse(msg: error.toString());
  }
}
