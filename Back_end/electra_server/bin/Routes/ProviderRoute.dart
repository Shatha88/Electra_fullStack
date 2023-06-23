// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middelwares/User/CheckToken_Middelware.dart';
import '../Response/User/Provider/addImageResponse.dart';
import '../Response/User/Provider/addStationResponse.dart';
import '../Response/User/Provider/deleteStationResponse.dart';
import '../Response/User/Provider/manageStationResponse.dart';
import '../Response/User/Provider/updateStationResponse.dart';
import '../Response/User/Provider/veiwStation.dart';
import '../Response/User/Provider/veiwStationDetalseResponse.dart';

class ProviderRoute {
  Handler get handler {
    final router = Router()
      ..post('/add_station', addStationResponse)
      ..delete("/delete_sation/<id>", deleteStationResponse)
      ..get("/view_station", veiwStation)
      ..get("/veiw_station_detales/<id>", veiwStationDetalseResponse)
      ..put("/update_station", updateStationResponse)
      ..post("/manage_staion", manageStationResponse)
      ..post("/add_image", addImageResponse);
    final pipline =
        Pipeline().addMiddleware(checkTokenMiddleware()).addHandler(router);

    return pipline;
  }
}
