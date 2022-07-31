import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'complete_details_event.dart';
part 'complete_details_state.dart';

class CompleteDetailsBloc extends Bloc<CompleteDetailsEvent, CompleteDetailsState> {
  CompleteDetailsBloc() : super(CompleteDetailsInitial()) {
    on<CompleteDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
