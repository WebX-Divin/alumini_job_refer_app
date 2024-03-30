import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jobapp_state.dart';

class JobappCubit extends Cubit<JobappState> {
  JobappCubit() : super(JobappInitial());
}
