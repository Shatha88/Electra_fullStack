// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:electra/services/api/project_api.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

//_________________ Storage to handle Token ____________
// const storage = FlutterSecureStorage();

// }

//_________________ Add Image _____________________________
Future<Response> AddImageStation({
  required File body,
}) async {
  try {
    final bytes = await body.readAsBytes();
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().addImg);
    var response = await http
        .post(url, body: bytes, headers: {"authorization": box.read("token")});

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response(error.toString(), 111);
  }
}

//_________________ Manage Station_____________________________

Future<Response> manageStation({
  required Map body,
}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().manageStation);
    var response = await http.post(url,
        body: json.encode(body), headers: {"authorization": box.read("token")});

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response("error", 111);
  }
}

//_________________ Update Station_____________________________

Future<Response> updateStation({
  required Map body,
}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().updateStation);
    var response = await http.put(url,
        body: json.encode(body), headers: {"authorization": box.read("token")});

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on FlutterError {
    return Response("error", 111);
  } catch (error) {
    return Response("error", 111);
  }
}

//_________________ Add Station _____________________________
Future<Response> Addstation({
  required Map body,
}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().addStation);
    var response = await http.post(url,
        body: json.encode(body), headers: {"authorization": box.read("token")});

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response("error", 111);
  }
}

//_________________ Get Station _____________________________

Future<Response> getStation() async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().viewStation);
    var response =
        await http.get(url, headers: {"authorization": box.read("token")});
    if (response.statusCode == 401) {
      box.remove("token");
    }
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on FlutterError {
    return Response("error", 111);
  } catch (error) {
    return Response("error", 111);
  }
}

//_________________ Get Station Details _____________________________

Future<Response> getStationID({required String id}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().viewStationDetailes + id);
    var response =
        await http.get(url, headers: {"authorization": box.read("token")});
    if (response.statusCode == 401) {
      box.remove("token");
    }
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on FlutterError {
    return Response("error", 111);
  } catch (error) {
    return Response("error", 111);
  }
}

//_________________ Delete Station _____________________________

Future<Response> DeleteStation({required String id}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(ProjectApi().url, ProjectApi().deleteStation + id);
    var response =
        await http.delete(url, headers: {"authorization": box.read("token")});
    if (response.statusCode == 401) {
      box.remove("token");
    }
    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } on FlutterError catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response(error.toString(), 111);
  }
}
