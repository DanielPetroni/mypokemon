class Pokemon {
  String name;
  String type;
  String descryption;
  String pathImage;

  Pokemon({this.name, this.type, this.descryption, this.pathImage});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    descryption = json['descryption'];
    pathImage = json['pathImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['descryption'] = this.descryption;
    return data;
  }
}