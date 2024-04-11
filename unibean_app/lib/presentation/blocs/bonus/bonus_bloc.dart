import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'bonus_event.dart';
part 'bonus_state.dart';

class BonusBloc extends Bloc<BonusEvent, BonusState> {
  final BonusRepository bonusRepository;
  BonusBloc(this.bonusRepository) : super(BonusInitial()) {
    scrollController.addListener(() {
      add(LoadMoreBonuses());
    });
    on<LoadBonus>(_onLoadBonus);
    on<LoadMoreBonuses>(_onLoadMoreBonuses);
    on<LoadBonusDetail>(_onLoadBonusDetail);
  }

  int pageBonus = 1;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();

  Future<void> _onLoadBonus(LoadBonus event, Emitter<BonusState> emit) async {
    emit(BonusLoading());
    try {
      var apiResponse = await bonusRepository.fecthBonuses(
          page: event.page, limit: event.limit);
      if (apiResponse!.pageSize == apiResponse.totalCount) {
        emit(BonusesLoaded(
            bonuses: apiResponse.result.toList(), hasReachedMax: true));
      } else {
        emit(BonusesLoaded(bonuses: apiResponse.result.toList()));
      }
    } catch (e) {
      emit(BonusesFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreBonuses(
      LoadMoreBonuses event, Emitter<BonusState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if ((this.state as BonusesLoaded).hasReachedMax) {
          emit(BonusesLoaded(
              bonuses: List.from((this.state as BonusesLoaded).bonuses),
              hasReachedMax: true));
        } else {
          isLoadingMore = true;
          pageBonus++;
          var apiResponse = await bonusRepository.fecthBonuses(
              page: pageBonus, limit: event.limit);
          if (apiResponse!.result.length == 0) {
            emit(BonusesLoaded(
                bonuses: List.from((this.state as BonusesLoaded).bonuses)
                  ..addAll(apiResponse.result),
                hasReachedMax: true));
            this.pageBonus = 1;
          } else {
            emit(BonusesLoaded(
                bonuses: List.from((this.state as BonusesLoaded).bonuses)
                  ..addAll(apiResponse.result)));
          }
        }
      }
    } catch (e) {
      emit(BonusesFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadBonusDetail(
      LoadBonusDetail event, Emitter<BonusState> emit) async {
    emit(BonusByIdLoading());
    try {
      var apiResponse =
          await bonusRepository.fetchBonus(bonusId: event.bonusId);

      emit(BonusByIdLoaded(bonusDetailModel: apiResponse!));
    } catch (e) {
      emit(BonusesFailed(error: e.toString()));
    }
  }
}
