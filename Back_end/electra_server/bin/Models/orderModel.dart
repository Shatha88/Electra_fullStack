// ignore_for_file: file_names

class OrderModel {
  String? id;
  String date;
  String price;
  String status;
  String providerID;
  String customerID;

  OrderModel({
    this.id,
    required this.date,
    required this.price,
    required this.status,
    required this.providerID,
    required this.customerID,
  });

  factory OrderModel.fromJson({required Map json}) {
    return OrderModel(
      id: json['id'],
      date: json['date'],
      price: json['price'],
      status: json['status'],
      providerID: json['id_prov'],
      customerID: json['id_cons'],
    );
  }

  toMap() {
    final jsonMap = {
      "id": id,
      "date": date,
      "price": price,
      "status": status,
      "id_prov": providerID,
      "id_cons": customerID,
    };

    if (id == null) {
      return jsonMap;
    }
    return {"id": id, ...jsonMap};
  }
}
