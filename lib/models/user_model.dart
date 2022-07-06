class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? address;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    return data;
  }
}
