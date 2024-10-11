import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pass_state.dart';

class PassCubit extends Cubit<PassState> {
  PassCubit() : super(PassInitial());
}
