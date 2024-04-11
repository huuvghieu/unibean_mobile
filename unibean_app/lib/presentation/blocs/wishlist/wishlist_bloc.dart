import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final StudentRepository studentRepository;
  final WishListRepository wishListRepository;
  WishlistBloc(
      {required this.studentRepository, required this.wishListRepository})
      : super(WishlistInitial()) {
    on<LoadWishListByStudentId>(_onLoadWishListByStudentId);
    on<CreateWishList>(_onCreateWishList);
  }

  Future<void> _onLoadWishListByStudentId(
      LoadWishListByStudentId event, Emitter<WishlistState> emit) async {
    emit(WishListLoading());
    try {
      var apiResponse = await wishListRepository.fetchWishLists();
      emit(WishListLoaded(wishList: apiResponse!.result));
    } catch (e) {
      emit(WishListFailed(error: e.toString()));
    }
  }

  Future<void> _onCreateWishList(
      CreateWishList event, Emitter<WishlistState> emit) async {
    emit(WishListLoading());
    try {
      var apiResponse = await wishListRepository.postWishList(
          studentId: event.studentId,
          brandId: event.brandId,
          description: "",
          state: true);
      
      emit(CreateWishListSuccess(wishlist: apiResponse!));
    } catch (e) {
      emit(WishListFailed(error: e.toString()));
    }
  }
}
