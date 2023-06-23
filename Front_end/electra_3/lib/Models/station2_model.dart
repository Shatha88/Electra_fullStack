class Station {
  String? id;
  String? location;
  String? workTime;
  String? rating;
  String? status;
  String? imageUrl;
  String? idProv;

  Station(
      {this.id,
      this.location,
      this.workTime,
      this.rating,
      this.status,
      this.imageUrl,
      this.idProv});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    workTime = json['work_time'];
    rating = json['rating'];
    status = json['status'];
    imageUrl = json['image_url'];
    idProv = json['id_prov'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['id'] = id;
    data['location'] = location;
    data['work_time'] = workTime;
    data['rating'] = rating;
    data['status'] = status;
    data['image_url'] = imageUrl;
    data['id_prov'] = idProv;
    return data;
  }
}
