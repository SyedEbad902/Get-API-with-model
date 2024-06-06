class PostModel {
  String? sId;
  String? name;
  String? age;

  PostModel({this.sId, this.name, this.age});

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}
