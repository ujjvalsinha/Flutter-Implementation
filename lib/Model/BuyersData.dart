// To parse this JSON data, do
//
//     final buyersData = buyersDataFromJson(jsonString);

import 'dart:convert';

List<BuyersData> buyersDataFromJson(String str) => List<BuyersData>.from(json.decode(str).map((x) => BuyersData.fromJson(x)));

String buyersDataToJson(List<BuyersData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BuyersData {
    BuyersData({
        this.id,
        this.commodityName,
        this.photo,
    });

    String id;
    String commodityName;
    String photo;

    factory BuyersData.fromJson(Map<String, dynamic> json) => BuyersData(
        id: json["id"],
        commodityName: json["commodityName"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "commodityName": commodityName,
        "photo": photo,
    };
}
