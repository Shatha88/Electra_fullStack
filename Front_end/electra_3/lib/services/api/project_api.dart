class ProjectApi
    with Api, AuthEndpoints, ConsumerEndpoints, ProviderEndpoints {}

mixin Api {
  String url = 'localhost:8080';
}

mixin AuthEndpoints {
  String createAccount = '/auth/create_account';
  String verifyEmail = 'auth/verification_email';
  String resetPass = 'auth/reset_password';
  String sendCode = 'auth/send_code';
  String changePass = 'auth/change_password';
  String loginAccount = '/auth/login';
}

mixin ConsumerEndpoints {
  String createOrder = '/consumer/place_order/';
  String readAll = '/consumer/view_orders';
  String getNearbyStations = '/consumer/view_stations_nearby/';
  String cancelOrder = '/consumer/cancel_order/';
}

mixin ProviderEndpoints {
  String addStation = '/provider/add_station';
  String viewStation = '/provider/view_station';
  String viewStationDetailes = '/provider/veiw_station_detales/';
  String deleteStation = '/provider/delete_sation/';
  String updateStation = '/provider/update_station';
  String manageStation = '/provider/manage_staion';
  String addImg = '/provider/add_image';
}
