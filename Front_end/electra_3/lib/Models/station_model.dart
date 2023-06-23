class Station2 {
  String? stationName;
  String? time;
  String? imageUrl;
  String? orderState;
  String? price;
  String? distance;
  String? address;
  String? discription;
  String? rating;

  Station2(
      {this.stationName,
      this.distance,
      this.imageUrl,
      this.time,
      this.orderState,
      this.price,
      this.address,
      this.discription,
      this.rating});

  Station2.fromJson(Map json) {
    stationName = json['stationName'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    orderState = json['orderState'];
    price = json['price'];
    distance = json['distance'];
    address = json['address'];
    discription = json['discription'];
    rating = json['rating'];
  }

  Map toJson() {
    final Map data = Map();
    data['stationName'] = stationName;
    data['time'] = time;
    data['imageUrl'] = imageUrl;
    data['orderState'] = orderState;
    data['price'] = price;
    data['distance'] = distance;
    data['address'] = address;
    data['discription'] = discription;
    data['rating'] = rating;
    return data;
  }
}
