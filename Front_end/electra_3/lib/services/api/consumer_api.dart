// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_storage/get_storage.dart';

//_________________ Storage to handle Token ____________
// const storage = FlutterSecureStorage();
// final box = GetStorage();

// }

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

import 'package:electra/services/api/project_api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//_________________ Storage to handle Token ____________
// const storage = FlutterSecureStorage();
// final box = GetStorage();
final box = GetStorage();

getStations() async {
  try {
    var url = Uri.http(ProjectApi().url, ProjectApi().getNearbyStations);
    var response =
        await http.get(url, headers: {"authorization": box.read("token")});

    return response;
  } on HttpException catch (error) {
    return Response(error.toString(), 503);
  } catch (error) {
    return Response(error.toString(), 500);
  }
}
