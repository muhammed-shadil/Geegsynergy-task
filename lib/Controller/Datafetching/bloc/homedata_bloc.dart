import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geeksynergy_mechine_task/Model/datamodel.dart';
import 'package:geeksynergy_mechine_task/Utils/api_repository/api_repository.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'homedata_event.dart';
part 'homedata_state.dart';

class HomedataBloc extends Bloc<HomedataEvent, HomedataState> {
  HomedataBloc() : super(HomedataInitial()) {
    on<Homedatafetch>(datafetching);
  }
  final Apirepository apirepository = Apirepository();
  late Datafetch data;
  FutureOr<void> datafetching(
      HomedataEvent event, Emitter<HomedataState> emit) async {
    emit(DataLoading());
    try {
      final Response response = await apirepository.homedata();
      final result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        data = Datafetch.fromMap(result);

        emit(DataSuccess(
          data: data,
        ));
      } else {
        emit(DataFailed(message: result['message']));
      }
    } catch (e) {
      emit(DataFailed(message: e.toString()));
    }
  }
}
