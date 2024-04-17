import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/job_repository.dart';
import '../data/token/tokenhandler.dart';
import '../models/job_models.dart';

part 'jobapp_state.dart';

class JobappCubit extends Cubit<JobappState> {
  final JobRepository _jobRepository;

  String? name;
  String? mobile;
  String? email;
  String? userType;

  JobappCubit(this._jobRepository) : super(JobappInitial()) {
    userDetails();
  }

  Future<void> fetchJobs() async {
    try {
      emit(JobappLoading());
      final fetchedJobs = await _jobRepository.fetchJobs();
      emit(JobappLoaded(fetchedJobs));
    } catch (e) {
      emit(JobappError(e.toString()));
    }
  }

  Future<void> userDetails() async {
    try {
      name = await TokenHandler.getData("name");
      mobile = await TokenHandler.getData("mobile");
      email = await TokenHandler.getData("email");
      userType = await TokenHandler.getData("userType");
    } catch (e) {
      throw e.toString();
    }
  }

  String? get userName => name;
  String? get userMobile => mobile;
  String? get userEmail => email;
  String? get userUserType => userType;
}
