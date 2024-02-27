import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/models.dart';

import '../../../domain/repositories.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository brandRepository;
  BrandBloc({required this.brandRepository}) : super(BrandInitial()) {
    on<LoadBrands>(_onLoadBrands);
  }

    Future<void> _onLoadBrands(
      LoadBrands event, Emitter<BrandState> emit) async {
    emit(BrandLoading());
    try {
      var apiResponse = await brandRepository.fecthBrands();
      emit(BrandsLoaded(brands: apiResponse!.result.toList()));
    } catch (e) {
      emit(BrandsFailed(error: e.toString()));
    }
  }
}
