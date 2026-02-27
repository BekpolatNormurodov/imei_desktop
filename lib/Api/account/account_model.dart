class AccountModel {
  int? count;
  // Null? next;
  // Null? previous;
  List<Results>? results;

  AccountModel({this.count, this.results});

  AccountModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    // next = json['next'];
    // previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    // data['next'] = this.next;
    // data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? phoneNumber;
  String? jton;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? lavozimi;
  Boshqarma? boshqarma;
  Boshqarma? bolim;
  Boshqarma? unvon;
  // List<Ishjoylari>? ishjoylari;

  Results({
    this.id,
    this.phoneNumber,
    this.jton,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.lavozimi,
    this.boshqarma,
    this.bolim,
    this.unvon,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    jton = json['jton'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    lavozimi = json['lavozimi'];
    boshqarma = json['boshqarma'] != null
        ? new Boshqarma.fromJson(json['boshqarma'])
        : null;
    bolim =
        json['bolim'] != null ? new Boshqarma.fromJson(json['bolim']) : null;
    unvon =
        json['unvon'] != null ? new Boshqarma.fromJson(json['unvon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['jton'] = this.jton;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['lavozimi'] = this.lavozimi;
    if (this.boshqarma != null) {
      data['boshqarma'] = this.boshqarma!.toJson();
    }
    if (this.bolim != null) {
      data['bolim'] = this.bolim!.toJson();
    }
    if (this.unvon != null) {
      data['unvon'] = this.unvon!.toJson();
    }
    return data;
  }
}

class Boshqarma {
  int? id;
  String? name;

  Boshqarma({this.id, this.name});

  Boshqarma.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
