// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  final String role;
  final String companyName;
  final String location;
  final bool remote;
  final bool fullTime;
  final int salary;
  final String referral;
  final String link;
  JobModel({
    required this.role,
    required this.companyName,
    required this.location,
    required this.remote,
    required this.fullTime,
    required this.salary,
    required this.referral,
    required this.link,
  });

  JobModel copyWith({
    String? role,
    String? companyName,
    String? location,
    bool? remote,
    bool? fullTime,
    int? salary,
    String? referral,
    String? link,
  }) {
    return JobModel(
      role: role ?? this.role,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
      remote: remote ?? this.remote,
      fullTime: fullTime ?? this.fullTime,
      salary: salary ?? this.salary,
      referral: referral ?? this.referral,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'companyName': companyName,
      'location': location,
      'remote': remote,
      'fullTime': fullTime,
      'salary': salary,
      'referral': referral,
      'link': link,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      role: map['job_role'] ?? '',
      companyName: map['company_name'] ?? '',
      location: map['location'] ?? '',
      remote: map['is_part_time'] ?? false,
      fullTime: map['is_office'] ?? false,
      salary: map['salary'] ?? '',
      referral: map['referral_code'] ?? '',
      link: map['apply_link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobModel(role: $role, companyName: $companyName, location: $location, remote: $remote, fullTime: $fullTime, salary: $salary, referral: $referral, link: $link)';
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.role == role &&
        other.companyName == companyName &&
        other.location == location &&
        other.remote == remote &&
        other.fullTime == fullTime &&
        other.salary == salary &&
        other.referral == referral &&
        other.link == link;
  }

  @override
  int get hashCode {
    return role.hashCode ^
        companyName.hashCode ^
        location.hashCode ^
        remote.hashCode ^
        fullTime.hashCode ^
        salary.hashCode ^
        referral.hashCode ^
        link.hashCode;
  }
}
