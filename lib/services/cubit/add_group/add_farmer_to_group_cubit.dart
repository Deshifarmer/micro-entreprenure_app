import 'package:bloc/bloc.dart';

class AddFarmerToGroupCubit extends Cubit<String> {
  AddFarmerToGroupCubit() : super('');

  void addFarmer(String newLeader) => emit(newLeader);
  void farmerReset() => emit('');
}

class UpdateLeaderToGroupCubit extends Cubit<String> {
  UpdateLeaderToGroupCubit() : super('');

  void updateLeader(String newLeader) => emit(newLeader);
  void leaderReset() => emit('');
}
