// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alumini_job_refer_app/data/data_provider/job_data_provider.dart';
import 'package:alumini_job_refer_app/models/job_models.dart';

class JobRepository {
  final JobDataProvider jobDataProvider;
  JobRepository(
    this.jobDataProvider,
  );

  Future signUp(
      String name, String email, String password, String mobile) async {
    Map<String, String> requestBody = {
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile
    };
    String signUpEndpoint = 'signup';
    try {
      final response =
          await jobDataProvider.postData(requestBody, signUpEndpoint);
      final data = jsonDecode(response);
      if (data != null) {
        return data;
      }
    } catch (error) {
      throw error.toString();
    }
  }

  Future login(String mobile, String password) async {
    Map<String, String> requestBody = {
      'mobile': mobile,
      'password': password,
    };
    String loginEndpoint = 'login';
    try {
      final response =
          await jobDataProvider.postData(requestBody, loginEndpoint);
      final data = jsonDecode(response);
      if (data != null) {
        return data;
      }
    } catch (error) {
      throw error.toString();
    }
  }

  Future createPost(
      String role,
      String companyName,
      String jobDescription,
      String location,
      bool remote,
      bool fullTime,
      String salary,
      String referralCode,
      String link) async {
    Map<String, dynamic> requestBody = {
      'job_role': role,
      'company_name': companyName,
      'job_description': jobDescription,
      'location': location,
      'is_part_time': remote,
      'is_office': fullTime,
      'salary': salary,
      'referral_code': referralCode,
      'apply_link': link,
    };
    String createPostEndpoint = 'create_post';
    try {
      final response =
          await jobDataProvider.postData(requestBody, createPostEndpoint);
      final data = jsonDecode(response);
      if (data != null) {
        return data;
      }
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<JobModel>> fetchJobs() async {
    String listPostsEndpoint = 'list_posts';

    try {
      final response = await jobDataProvider.getData(listPostsEndpoint);
      final data = jsonDecode(response) as List;
      return data.map((job) => JobModel.fromMap(job)).toList();
    } catch (error) {
      throw error.toString();
    }
  }

  Future<dynamic> sendSkillRatings(Map<String, int> ratings) async {
    Map<String, int> requestBody = ratings;
    String predictEndpoint = 'predict';

    try {
      final response =
          await jobDataProvider.postData(requestBody, predictEndpoint);
      final data = jsonDecode(response);
      if (data != null) {
        return data;
      }
    } catch (error) {
      throw error.toString();
    }
  }
}