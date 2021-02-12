class User {
  String id;
  String name;
  String email;
  List<Pokemon> listPokemon;

  User({this.id, this.name, this.email, this.listPokemon});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    if (json['listPokemon'] != null) {
      listPokemon = new List<Pokemon>();
      json['listPokemon'].forEach((v) {
        listPokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.listPokemon != null) {
      data['listPokemon'] = this.listPokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String name;
  String type;
  String descryption;

  Pokemon({this.name, this.type, this.descryption});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    descryption = json['descryption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['descryption'] = this.descryption;
    return data;
  }
}