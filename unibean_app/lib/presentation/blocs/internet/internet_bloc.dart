import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;
  InternetBloc() : super(InternetInitial()) {
    on<OnConnected>(
      (event, emit) => emit(Connected(message: "Đã kết nối mạng")),
    );
    on<OnNotConnected>(
      (event, emit) => emit(NotConnected(message: "Vui lòng kết nối mạng")),
    );

    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((result) {
    //       if
    //     });
  }
}
