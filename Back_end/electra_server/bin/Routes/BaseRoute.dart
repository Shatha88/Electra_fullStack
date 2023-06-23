// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';
import 'ConsumerRoute.dart';
import 'ProviderRoute.dart';

class BaseRoute {
  Handler get handler {
    final router = Router()
      ..mount('/auth', AuthRoute().handler)
      ..mount('/provider', ProviderRoute().handler)
      ..mount('/consumer', ConsumerRoute().handler)
      ..all('/<name|.*>', (Request _) {
        return Response.notFound(" page not found please change your path");
      });

    return router;
  }
}
