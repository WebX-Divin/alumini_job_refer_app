// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  final String id;
  final String role;
  final String companyName;
  final String jobDescription;
  final String location;
  final bool isPartTime;
  final bool isOffice;
  final int salary;
  final String referralCode;
  final String applyLink;

  JobModel({
    required this.id,
    required this.role,
    required this.companyName,
    required this.jobDescription,
    required this.location,
    required this.isPartTime,
    required this.isOffice,
    required this.salary,
    required this.referralCode,
    required this.applyLink,
  });

  JobModel copyWith({
    String? id,
    String? role,
    String? companyName,
    String? jobDescription,
    String? location,
    bool? isPartTime,
    bool? isOffice,
    int? salary,
    String? referralCode,
    String? applyLink,
  }) {
    return JobModel(
      id: id ?? this.id,
      role: role ?? this.role,
      companyName: companyName ?? this.companyName,
      jobDescription: jobDescription ?? this.jobDescription,
      location: location ?? this.location,
      isPartTime: isPartTime ?? this.isPartTime,
      isOffice: isOffice ?? this.isOffice,
      salary: salary ?? this.salary,
      referralCode: referralCode ?? this.referralCode,
      applyLink: applyLink ?? this.applyLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'companyName': companyName,
      'jobDescription': jobDescription,
      'location': location,
      'isPartTime': isPartTime,
      'isOffice': isOffice,
      'salary': salary,
      'referralCode': referralCode,
      'applyLink': applyLink,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] ?? '',
      role: map['job_role'] ?? '',
      companyName: map['company_name'] ?? '',
      jobDescription: map['job_description'] ?? '',
      location: map['location'] ?? '',
      isPartTime: map['is_part_time'] ?? false,
      isOffice: map['is_office'] ?? false,
      salary: map['salary'] ?? 0,
      referralCode: map['referral_code'] ?? '',
      applyLink: map['apply_link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobModel(id: $id, role: $role, companyName: $companyName, jobDescription: $jobDescription, location: $location, isPartTime: $isPartTime, isOffice: $isOffice, salary: $salary, referralCode: $referralCode, applyLink: $applyLink)';
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.role == role &&
        other.companyName == companyName &&
        other.jobDescription == jobDescription &&
        other.location == location &&
        other.isPartTime == isPartTime &&
        other.isOffice == isOffice &&
        other.salary == salary &&
        other.referralCode == referralCode &&
        other.applyLink == applyLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        role.hashCode ^
        companyName.hashCode ^
        jobDescription.hashCode ^
        location.hashCode ^
        isPartTime.hashCode ^
        isOffice.hashCode ^
        salary.hashCode ^
        referralCode.hashCode ^
        applyLink.hashCode;
  }
}
