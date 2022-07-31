part of 'home_client_bloc.dart';

abstract class HomeClientState extends Equatable {
  const HomeClientState();  

  @override
  List<Object> get props => [];
}
class HomeClientInitial extends HomeClientState {}
