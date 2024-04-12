import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';

import '../../../data/models.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<LoadNotification>(_onLoadNotification);
    on<AddNewNotification>(_onAddNewNotification);
  }

  Future<void> _onLoadNotification(
      LoadNotification event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    try {
      final notifications = await AuthenLocalDataSource.getNotifications();
      if (notifications == null) {
        emit(NotificationLoaded(notifications: []));
      } else {
        emit(NotificationLoaded(notifications: notifications));
      }
    } catch (e) {
      emit(NotificationFailed(error: e.toString()));
    }
  }

  Future<void> _onAddNewNotification(
      AddNewNotification event, Emitter<NotificationState> emit) async {
    try {
      final notifications = await AuthenLocalDataSource.getNotifications();
      if (notifications == null) {
        List<NotificationModel> listNoti = [];
        listNoti.add(NotificationModel(
            title: event.notificationModel.title,
            body: event.notificationModel.body,
            payload: event.notificationModel.payload));
        List<Map<String, dynamic>> jsonList =
            listNoti.map((item) => item.toJson()).toList();
        String notiString = json.encode(jsonList);
        AuthenLocalDataSource.saveNotification(notiString);
        emit(NewNotification());
      } else {
        notifications.add(NotificationModel(
            title: event.notificationModel.title,
            body: event.notificationModel.body,
            payload: event.notificationModel.payload));
        List<Map<String, dynamic>> jsonList =
            notifications.map((item) => item.toJson()).toList();
        String notiString = json.encode(jsonList);
        AuthenLocalDataSource.saveNotification(notiString);
        emit(NewNotification());
      }
    } catch (e) {
      emit(NotificationFailed(error: e.toString()));
    }
  }
}
