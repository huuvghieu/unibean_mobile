part of 'brand_bloc.dart';

sealed class BrandEvent extends Equatable {
  const BrandEvent();
}

final class LoadBrands extends BrandEvent {
  @override
  List<Object?> get props => [];
}