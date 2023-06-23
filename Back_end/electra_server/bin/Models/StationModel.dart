// ignore_for_file: file_names

class StationModel {
  String? id;
  String location;
  String status;
  String? workTime;
  String? rating;
  String? imageUrl;
  String providerID;

  StationModel({
    this.id,
    required this.location,
    required this.status,
    this.workTime,
    this.rating,
    this.imageUrl,
    required this.providerID,
  });

  factory StationModel.fromJson({required Map json}) {
    return StationModel(
      id: json["id"],
      location: json["location"],
      status: json["status"],
      workTime: json["work_time"],
      rating: json["rating"],
      imageUrl: json['image_url'],
      providerID: json["id_prov"],
    );
  }

  toMap() {
    final jsonMap = {
      "id": id,
      "location": location,
      "status": status,
      "work_time": workTime,
      "image_url": imageUrl,
      "id_prov": providerID,
    };

    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}
