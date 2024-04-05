part of 'wishlist_bloc.dart';

sealed class WishlistEvent extends Equatable {
  const WishlistEvent();
}

final class LoadWishListByStudentId extends WishlistEvent {
  @override
  List<Object?> get props => [];
}

final class CreateWishList extends WishlistEvent {
  final String studentId;
  final String brandId;
  final String description;
  final bool state;

  CreateWishList(
      {required this.studentId,
      required this.brandId,
      required this.description,
      required this.state});

  @override
  List<Object?> get props => [studentId, brandId, description, state];
}
