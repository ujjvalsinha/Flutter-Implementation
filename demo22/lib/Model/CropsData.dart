class CropData {
  String id;
  String commodityName;
  String photo;

  CropData({this.id, this.commodityName, this.photo});

  factory CropData.fromMap(Map<String, dynamic> json) {
    return CropData(
        id: json['id'],
        commodityName: json['commodityName'],
        photo: json['photo']);
  }
}
