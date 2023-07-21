class RegisterUserModel {
  String? Name;
  String? bloodGroup;
  String? Phone;
  String? email;
  String? password;
  RegisterUserModel(
      {this.Name, this.Phone, this.email, this.password, this.bloodGroup});
  factory RegisterUserModel.fromJson(Map<String, dynamic> data) {
    return RegisterUserModel(
      Name: data['name'],
      Phone: data['Phone'],
      email: data['email'],
      password: data['password'],
      bloodGroup: data['bloodGroup'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'Name': Name,
      'Phone': Phone,
      'email': email,
      'password': password,
      'bloodGroup': bloodGroup,
    };
  }
}
