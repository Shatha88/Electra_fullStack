// ignore_for_file: file_names

class ConsumerModel {
  final int? id;
  final String? name;
  final String? phone;
  final String bankAccount;
  final String email;
  final String idAuth;

  ConsumerModel(
      {this.id,
      this.name,
      this.phone,
      required this.email,
      required this.bankAccount,
      required this.idAuth});

  factory ConsumerModel.fromJson({required Map json}) {
    return ConsumerModel(
        id: json["id"],
        name: json['name'],
        phone: json["phone"],
        bankAccount: json["bank_account"],
        email: json['email'],
        idAuth: json['id_auth']);
  }

  toMap() {
    final jsonMap = {
      "name": name ?? 'Guest',
      "phone": phone,
      "bank_account": bankAccount,
      "email": email,
      "id_auth": idAuth,
    };

    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}
