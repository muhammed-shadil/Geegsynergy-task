part of 'homedata_bloc.dart';

@immutable
sealed class HomedataState {}

final class HomedataInitial extends HomedataState {}

final class DataLoading extends HomedataState {}

final class DataSuccess extends HomedataState {
  final String message;

  DataSuccess({required this.message});
}

final class DataFailed extends HomedataState {
  final String message;

  DataFailed({required this.message});
}
