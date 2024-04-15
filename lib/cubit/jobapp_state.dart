// jobapp_state.dart
part of 'jobapp_cubit.dart';

@immutable
abstract class JobappState {}

class JobappInitial extends JobappState {}

class JobappLoading extends JobappState {}

class JobappLoaded extends JobappState {
  final List<JobModel> jobs;

  JobappLoaded(this.jobs);
}

class JobappError extends JobappState {
  final String errorMessage;

  JobappError(this.errorMessage);
}
