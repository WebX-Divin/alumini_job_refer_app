import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/job_repository.dart';
import '../models/job_models.dart';

part 'jobapp_state.dart';

class JobappCubit extends Cubit<JobappState> {
  final JobRepository _jobRepository;

  JobappCubit(this._jobRepository) : super(JobappInitial());

  Future<void> fetchJobs() async {
    try {
      emit(JobappLoading());
      final fetchedJobs = await _jobRepository.fetchJobs();
      emit(JobappLoaded(fetchedJobs));
    } catch (e) {
      emit(JobappError(e.toString()));
    }
  }
}
