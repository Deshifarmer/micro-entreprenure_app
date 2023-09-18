import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farm_entity/all_farm_entity.dart';
import 'package:equatable/equatable.dart';

part 'farmer_fetch_farm_event.dart';
part 'farmer_fetch_farm_state.dart';

class FarmerFetchFarmBloc
    extends Bloc<FarmerFetchFarmEvent, FarmerFetchFarmState> {
  FarmerFetchFarmBloc() : super(FarmerFetchFarmInitial()) {
    on<FarmerFetchFarmEvent>((event, emit) {});
    on<FramFetchEvent>((FramFetchEvent event, emit) async {
      emit(FarmerFetchFarmLoading());
      final data =
          await _deshifarmerAPI.fetchFarmData(event.token, event.farmerID);

      final value = switch (data) {
        Success(data: final succ) => succ,
        ServerFailor(error: final err) => err,
      };

      if (value is AllFarmListResp) {
        print('farm value is good');
        emit(FarmerFetchFarmSuccess(value));
      } else {
        print('exception occured farm');
        emit(FarmerFetchFarmFailed());
      }
    });
  }
  final DeshiFarmerAPI _deshifarmerAPI = DeshiFarmerAPI();
}
