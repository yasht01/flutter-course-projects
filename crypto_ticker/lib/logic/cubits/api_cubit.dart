import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
}
