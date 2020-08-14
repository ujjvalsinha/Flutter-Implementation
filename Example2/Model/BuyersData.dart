class Buyers {
  String id;
  String buyerName;
  String photo;
  CropInfo cropInfo;
  Location location;
  List<Price> price;

  Buyers(
      {this.id,
      this.buyerName,
      this.photo,
      this.cropInfo,
      this.location,
      this.price});

  Buyers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerName = json['buyerName'];
    photo = json['photo'];
    cropInfo = json['cropInfo'] != null
        ? new CropInfo.fromJson(json['cropInfo'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['price'] != null) {
      price = new List<Price>();
      json['price'].forEach((v) {
        price.add(new Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyerName'] = this.buyerName;
    data['photo'] = this.photo;
    if (this.cropInfo != null) {
      data['cropInfo'] = this.cropInfo.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CropInfo {
  String crop;
  String photo;

  CropInfo({this.crop, this.photo});

  CropInfo.fromJson(Map<String, dynamic> json) {
    crop = json['crop'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop'] = this.crop;
    data['photo'] = this.photo;
    return data;
  }
}

class Location {
  String lat;
  String lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Price {
  String date;
  String price;
  String sku;

  Price({this.date, this.price, this.sku});

  Price.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    price = json['price'];
    sku = json['sku'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['price'] = this.price;
    data['sku'] = this.sku;
    return data;
  }
}
