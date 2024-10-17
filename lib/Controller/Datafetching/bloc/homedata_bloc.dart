import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geeksynergy_mechine_task/Utils/api_repository/api_repository.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'homedata_event.dart';
part 'homedata_state.dart';

class HomedataBloc extends Bloc<HomedataEvent, HomedataState> {
  HomedataBloc() : super(HomedataInitial()) {
    on<HomedataEvent>(handler);
  }
  final Apirepository apirepository = Apirepository();

  FutureOr<void> handler(
      HomedataEvent event, Emitter<HomedataState> emit) async {
    emit(DataLoading());
    try {
      Map data = Map();
      final Response response = await apirepository.homedata(data);
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(DataSuccess(
          message: result['message'],
        ));
      } else {
        emit(DataFailed(message: result['message']));
      }
    } catch (e) {
      emit(DataFailed(message: e.toString()));
    }
  }
}
