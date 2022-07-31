import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_option_event.dart';
part 'choose_option_state.dart';

class ChooseOptionBloc extends Bloc<ChooseOptionEvent, ChooseOptionState> {
  ChooseOptionBloc() : super(ChooseOptionInitial()) {
    on<ChooseOptionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
