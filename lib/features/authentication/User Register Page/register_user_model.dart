class RegisterUserModel {
  String? name;
  String? bloodGroup;
  String? phone;
  String? email;
  String? password;
  RegisterUserModel(
      {this.name, this.phone, this.email, this.password, this.bloodGroup});
  factory RegisterUserModel.fromJson(Map<String, dynamic> data) {
    return RegisterUserModel(
      name: data['name'],
      phone: data['Phone'],
      email: data['email'],
      password: data['password'],
      bloodGroup: data['bloodGroup'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Phone': phone,
      'email': email,
      'password': password,
      'bloodGroup': bloodGroup,
    };
  }
}
