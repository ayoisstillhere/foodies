import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'partner_state.dart';

class PartnerCubit extends Cubit<PartnerState> {
  PartnerCubit() : super(PartnerInitial());
}
