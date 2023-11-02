import 'package:bloc/bloc.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farm_entity/all_farm_entity.dart';
import 'package:deshifarmer/domain/entities/farm_entity/farm_entity.dart';
import 'package:equatable/equatable.dart';

part 'farmer_fetch_farm_event.dart';
part 'farmer_fetch_farm_state.dart';

class FarmerFetchFarmBloc
    extends Bloc<FarmerFetchFarmEvent, FarmerFetchFarmState> {
  FarmerFetchFarmBloc() : super(FarmerFetchFarmInitial()) {
    on<FarmerFetchFarmEvent>((event, emit) {});
    on<FarmResetEvent>((event, emit) => emit(FarmerFetchFarmInitial()));
    on<FramFetchEvent>((FramFetchEvent event, emit) async {
      emit(FarmerFetchFarmLoading());
      final data =
          await _deshifarmerAPI.getSingleFarmer(event.token, event.farmerID);

      // List<FarmEntity> _farms = data.farm_list
      /// convert all data.farm_list to List<FarmEntity>
      final farms = <FarmEntity>[];
      if (data == null) {
        emit(FarmerFetchFarmFailed());
      } else {
        for (final element in data.farm_list) {
          farms.add(FarmEntity.fromJson(element as Map<String, dynamic>));
        }
        final value = AllFarmListResp(farms);

        emit(FarmerFetchFarmSuccess(value));
      }
    });
  }
  final DeshiFarmerAPI _deshifarmerAPI = DeshiFarmerAPI();
}
