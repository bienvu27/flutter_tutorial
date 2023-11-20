class Model {
  int? id;
  String? userName;
  String? petName;
  String? petImage;
  bool? isFriendly;

  Model({this.id, this.userName, this.petName, this.petImage, this.isFriendly});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    petName = json['petName'];
    petImage = json['petImage'];
    isFriendly = json['isFriendly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['userName'] = userName;
    data['petName'] = petName;
    data['petImage'] = petImage;
    data['isFriendly'] = isFriendly;
    return data;
  }
}
