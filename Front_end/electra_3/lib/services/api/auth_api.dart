import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:electra/services/api/project_api.dart';

//_________________ Storage to handle Token ____________
// const storage = FlutterSecureStorage();
final box = GetStorage();

// tokenInitialized() async {
//   try {
//     if (storage.read(key: 'token').isUndefinedOrNull) {
//       return false;
//     } else {
//       return true;
//     }
//   } catch (error) {
//     return null;
//   }
// }

//_________________ Signup API _____________________________
Future<Response> createAccount(
    {required Map body, required String userType}) async {
  try {
    var url = Uri.http(ProjectApi().url, ProjectApi().createAccount);
    var response = await http
        .post(url, body: json.encode(body), headers: {"User-Type": userType});

    return response;
  } on HttpException catch (error) {
    return Response(error.toString(), 503);
  } catch (error) {
    log(error.toString());
    return Response(error.toString(), 500);
  }
}

//_________________ Login API _____________________________
Future<Response> loginAccount({required Map body}) async {
  try {
    var url = Uri.http(ProjectApi().url, ProjectApi().loginAccount);
    var response = await http.post(url, body: json.encode(body));
    log('Here i am');
    return response;
  } on HttpException catch (error) {
    return Response(error.toString(), 503);
  } catch (error) {
    return Response(error.toString(), 500);
  }
}
// //_________________ Logout API _____________________________
// Future<Response> loguotAccount({required Map body}) async {
//   try {
//     var url = Uri.http(ProjectApi().url, ProjectApi().loginAccount);
//     var response = await http.get(url);
//     print('Here i am');
//     return response;
//   } on HttpException catch (error) {
//     return Response(error.toString(), 503);
//   } catch (error) {
//     return Response(error.toString(), 500);
//   }
// }
