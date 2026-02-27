class ArizaModel {
  int? totalRecords;
  int? totalPages;
  int? currentPage;
  bool? next;
  bool? previous;
  List<Data>? data;

  ArizaModel(
      {this.totalRecords,
      this.totalPages,
      this.currentPage,
      this.next,
      this.previous,
      this.data});

  ArizaModel.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total_records'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    next = json['next'];
    previous = json['previous'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_records'] = this.totalRecords;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Author? author;
  String? status;
  String? imei;
  String? lastSimcard;
  String? model;
  String? color;
  String? createdAt;
  String? updatedAt;
  Owner? owner;

  Data(
      {this.id,
      this.author,
      this.status,
      this.imei,
      this.lastSimcard,
      this.model,
      this.color,
      this.createdAt,
      this.updatedAt,
      this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    status = json['status'];
    imei = json['imei'];
    lastSimcard = json['last_simcard'];
    model = json['model'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['status'] = this.status;
    data['imei'] = this.imei;
    data['last_simcard'] = this.lastSimcard;
    data['model'] = this.model;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}

class Author {
  int? id;
  String? username;

  Author({this.id, this.username});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}

class Owner {
  int? id;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNumber;
  String? jshir;

  Owner(
      {this.id,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.phoneNumber,
      this.jshir});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
    jshir = json['jshir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['phone_number'] = this.phoneNumber;
    data['jshir'] = this.jshir;
    return data;
  }
}
