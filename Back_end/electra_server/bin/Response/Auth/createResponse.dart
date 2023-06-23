// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Models/ConsumerModel.dart';
import '../../Models/ProviderModel.dart';
import '../../RespnseMsg/CustomResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

createResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);
    print('headers:' + req.headers.toString());
    if (req.headers['user-type']!.toUpperCase() != 'CONSUMER' &&
        req.headers['user-type']!.toUpperCase() != 'PROVIDER') {
      return CustomResponse().errorResponse(
        msg: "undefined user",
      );
    }

    if (req.headers['user-type']!.toUpperCase() == 'CONSUMER') {
      print('consumer');
      if (
          // !body.containsKey('bank_account') &&
          !body.containsKey('email') && !body.containsKey('password')) {
        return CustomResponse().errorResponse(
          msg: "missing required information",
        );
      }

      final supabaseVariable = SupabaseEnv().supabase.auth;
      UserResponse userInfo = await supabaseVariable.admin.createUser(
        AdminUserAttributes(email: body['email'], password: body['password']),
      );

      ConsumerModel userObject = ConsumerModel(
        email: userInfo.user!.email!,
        name: body['name'],
        phone: body['phone'],
        bankAccount: body['bank_account'],
        idAuth: userInfo.user!.id,
      );
      await supabaseVariable.signInWithOtp(email: body['email']);
      await SupabaseEnv().supabase.from("consumers").insert(userObject.toMap());
      return CustomResponse().successResponse(
        msg: "create account page",
        data: {"email": body['email']},
      );
    }

    if (req.headers['user-type']!.toUpperCase() == 'PROVIDER') {
      print('provider');
      if (
          // !body.containsKey('bank_account') &&
          !body.containsKey('email') &&
              // !body.containsKey('address') &&
              !body.containsKey('password')) {
        return CustomResponse().errorResponse(
          msg: "missing required information",
        );
      }

      final supabaseVariable = SupabaseEnv().supabase.auth;
      UserResponse userInfo = await supabaseVariable.admin.createUser(
        AdminUserAttributes(email: body['email'], password: body['password']),
      );
      ProviderModel userObject = ProviderModel(
        email: userInfo.user!.email!,
        name: body['name'],
        phone: body['phone'],
        address: body['address'],
        bankAccount: body['bank_account'],
        idAuth: userInfo.user!.id,
      );
      await supabaseVariable.signInWithOtp(email: body['email']);
      await SupabaseEnv().supabase.from("providers").insert(userObject.toMap());
      return CustomResponse().successResponse(
        msg: "create account page",
        data: {"email": body['email']},
      );
    }
  } catch (error) {
    print(error.toString());
    return CustomResponse().errorResponse(
      msg: error.toString(),
    );
  }
}
