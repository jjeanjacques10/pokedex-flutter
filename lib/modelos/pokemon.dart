class Pokemon {
  int id;
  Name name;
  List<String> type;
  Base base;

  Pokemon({this.id, this.name, this.type, this.base});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    type = json['type'].cast<String>();
    base = json['base'] != null ? new Base.fromJson(json['base']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['type'] = this.type;
    if (this.base != null) {
      data['base'] = this.base.toJson();
    }
    return data;
  }
}

class Name {
  String english;
  String japanese;
  String chinese;
  String french;

  Name({this.english, this.japanese, this.chinese, this.french});

  Name.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    japanese = json['japanese'];
    chinese = json['chinese'];
    french = json['french'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english'] = this.english;
    data['japanese'] = this.japanese;
    data['chinese'] = this.chinese;
    data['french'] = this.french;
    return data;
  }
}

class Base {
  int hP;
  int attack;
  int defense;
  int spAttack;
  int spDefense;
  int speed;

  Base(
      {this.hP,
        this.attack,
        this.defense,
        this.spAttack,
        this.spDefense,
        this.speed});

  Base.fromJson(Map<String, dynamic> json) {
    hP = json['HP'];
    attack = json['Attack'];
    defense = json['Defense'];
    spAttack = json['Sp. Attack'];
    spDefense = json['Sp. Defense'];
    speed = json['Speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HP'] = this.hP;
    data['Attack'] = this.attack;
    data['Defense'] = this.defense;
    data['Sp. Attack'] = this.spAttack;
    data['Sp. Defense'] = this.spDefense;
    data['Speed'] = this.speed;
    return data;
  }

  String pokemonBases(){
    String text = 'HP  ${this.hP} \n'
        'Attack:  ${this.attack} \n'
        'Defense:  ${this.defense} \n'
        'Sp. Attack:  ${this.spAttack} \n'
        'Sp. Defense:  ${this.spDefense} \n'
        'Speed:  ${this.speed} \n';
    return text;
  }

}