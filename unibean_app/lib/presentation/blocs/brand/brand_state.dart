part of 'brand_bloc.dart';

sealed class BrandState extends Equatable {
  const BrandState();

}

final class BrandInitial extends BrandState {
  @override
  List<Object?> get props => [];
}
final class BrandLoading extends BrandState {
  @override
  List<Object?> get props => [];
}

final class BrandsLoaded extends BrandState {
  final List<BrandModel> brands;

  BrandsLoaded({required this.brands});
  @override
  List<Object?> get props => [brands];
}

final class BrandsFailed extends BrandState {
  final String error;

  BrandsFailed({required this.error});
  @override
  List<Object?> get props => [error];
}
