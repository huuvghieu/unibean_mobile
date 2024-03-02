import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../../../domain/repositories.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository brandRepository;
  BrandBloc({required this.brandRepository}) : super(BrandInitial()) {
    scrollController.addListener(() {
      add(LoadMoreBrands());
    });

    on<LoadBrands>(_onLoadBrands);
    on<LoadMoreBrands>(_onLoadMoreBrands);
  }

  int page = 1;
  ScrollController scrollController = ScrollController();
  var isLoadingMore = false;

  //------------
  Future<void> _onLoadBrands(LoadBrands event, Emitter<BrandState> emit) async {
    emit(BrandLoading());
    try {
      var apiResponse = await brandRepository.fecthBrands();
      emit(BrandsLoaded(brands: apiResponse!.result.toList()));
    } catch (e) {
      emit(BrandsFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreBrands(
      LoadMoreBrands event, Emitter<BrandState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        page++;
        var apiResponse = await brandRepository.fecthBrands(page: page);
        emit(BrandsLoaded(
            brands: List.from((this.state as BrandsLoaded).brands)
              ..addAll(apiResponse!.result)));
      }
    } catch (e) {
      emit(BrandsFailed(error: e.toString()));
    }
  }
}
