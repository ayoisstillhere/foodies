import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_partner_event.dart';
part 'home_partner_state.dart';

class HomePartnerBloc extends Bloc<HomePartnerEvent, HomePartnerState> {
  HomePartnerBloc() : super(HomePartnerInitial()) {
    on<HomePartnerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
