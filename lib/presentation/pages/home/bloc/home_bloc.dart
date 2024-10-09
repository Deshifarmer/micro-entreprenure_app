// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// part 'home_event.dart';
// part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(const HomeInitial()) {
//     // on<GetUserProfileEvent>(_onGetUserProEvent);
//     on<ChangePageEvent>(_onCustomHomeEvent);
//   }

//   FutureOr<void> _onCustomHomeEvent(
//     ChangePageEvent event,
//     Emitter<HomeState> emit,
//   ) {
//     switch (event.index) {
//       case 0:
//         emit(const HomeInitial());
//       case 1:
//         emit(const MyOrderPageState());
//       case 2:
//         emit(const CommisionPageState());
//       case 3:
//         emit(const MyProfilePageState());
//       default:
//         emit(const HomeInitial());
//     }
//   }
// }
