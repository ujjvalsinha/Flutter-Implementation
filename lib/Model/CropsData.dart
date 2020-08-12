// To parse this JSON data, do
//
//     final cropsData = cropsDataFromJson(jsonString);

import 'dart:convert';

List<CropsData> cropsDataFromJson(String str) => List<CropsData>.from(json.decode(str).map((x) => CropsData.fromJson(x)));

String cropsDataToJson(List<CropsData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CropsData {
    CropsData({
        this.id,
        this.buyerName,
        this.photo,
        this.cropInfo,
        this.location,
        this.price,
    });

    String id;
    String buyerName;
    String photo;
    CropInfo cropInfo;
    Location location;
    List<Price> price;

    factory CropsData.fromJson(Map<String, dynamic> json) => CropsData(
        id: json["id"],
        buyerName: json["buyerName"],
        photo: json["photo"],
        cropInfo: CropInfo.fromJson(json["cropInfo"]),
        location: Location.fromJson(json["location"]),
        price: List<Price>.from(json["price"].map((x) => Price.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "buyerName": buyerName,
        "photo": photo,
        "cropInfo": cropInfo.toJson(),
        "location": location.toJson(),
        "price": List<dynamic>.from(price.map((x) => x.toJson())),
    };
}

class CropInfo {
    CropInfo({
        this.crop,
        this.photo,
    });

    String crop;
    String photo;

    factory CropInfo.fromJson(Map<String, dynamic> json) => CropInfo(
        crop: json["crop"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "crop": crop,
        "photo": photo,
    };
}

class Location {
    Location({
        this.lat,
        this.lng,
    });

    String lat;
    String lng;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Price {
    Price({
        this.date,
        this.price,
        this.sku,
    });

    String date;
    String price;
    String sku;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        date: json["date"],
        price: json["price"],
        sku: json["sku"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "price": price,
        "sku": sku,
    };
}
