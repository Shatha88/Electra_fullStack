import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'Routes/BaseRoute.dart';
import 'env/BaseEnv.dart';

Future<void> main() async {
  withHotreload(
    () => createServer(),
    logLevel: Level.INFO,
  );
}

Future<HttpServer> createServer() async {
  final pipline = Pipeline().addHandler(BaseRoute().handler);

  final server = await serve(pipline, BaseEnv().ip, BaseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}
