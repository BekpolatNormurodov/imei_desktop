class AuthorizationModel {
  String? phone;
  String? jton;
  AuthorizationModel({
    required this.phone,
    required this.jton,
  });

  AuthorizationModel.fromJson(Map<String, dynamic> json) {
    phone = json['username'];
    jton = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.phone;
    data['password'] = this.jton;
    return data;
  }
}