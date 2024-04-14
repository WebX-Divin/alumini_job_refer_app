// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetailsModel {
  final String name;
  final String email;
  final String mobile;
  final String userType;
  UserDetailsModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.userType,
  });

  UserDetailsModel copyWith({
    String? name,
    String? email,
    String? mobile,
    String? userType,
  }) {
    return UserDetailsModel(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'mobile': mobile,
      'userType': userType,
    };
  }

  factory UserDetailsModel.fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'] ?? '',
      userType: map['userType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetailsModel.fromJson(String source) =>
      UserDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDetailsModel(name: $name, email: $email, mobile: $mobile, userType: $userType)';
  }

  @override
  bool operator ==(covariant UserDetailsModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.mobile == mobile &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ mobile.hashCode ^ userType.hashCode;
  }
}
