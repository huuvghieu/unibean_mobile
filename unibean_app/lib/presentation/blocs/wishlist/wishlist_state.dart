part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();
}

final class WishlistInitial extends WishlistState {
  @override
  List<Object?> get props => [];
}

final class WishListLoading extends WishlistState {
  @override
  List<Object?> get props => [];
}

final class WishListLoaded extends WishlistState {
  final List<String> wishList;

  WishListLoaded({required this.wishList});

  @override
  List<Object?> get props => [wishList];
}

final class CreateWishListSuccess extends WishlistState {
  final WishListModel wishlist;
  CreateWishListSuccess({required this.wishlist});

  @override
  List<Object?> get props => [wishlist];
}

final class WishListFailed extends WishlistState {
  final String error;

  WishListFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
