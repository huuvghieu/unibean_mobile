part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();
}

final class NotificationInitial extends NotificationState {
  @override
  List<Object?> get props => [];
}

final class NotificationLoading extends NotificationState {
  @override
  List<Object?> get props => [];
}

final class NewNotification extends NotificationState {
  @override
  List<Object?> get props => [];
}

final class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationLoaded({required this.notifications});

  @override
  List<Object?> get props => [this.notifications];
}

final class NotificationFailed extends NotificationState {
  final String error;

  NotificationFailed({required this.error});

  @override
  List<Object?> get props => [this.error];
}
