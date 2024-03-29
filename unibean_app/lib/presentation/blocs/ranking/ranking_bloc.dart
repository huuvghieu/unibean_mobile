import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  final StoreRepository storeRepository;
  RankingBloc({required this.storeRepository}) : super(RankingInitial()) {
    on<LoadCampaignRanking>(_onLoadCampaignRanking);
    on<LoadStudentRanking>(_onLoadStudentRanking);
  }

  Future<void> _onLoadCampaignRanking(
      LoadCampaignRanking event, Emitter<RankingState> emit) async {
    emit(CampaignRankingLoading());
    try {
      var apiResponse = await storeRepository.fecthCampaignRanking();

      emit(CampaignRankingLoaded(campaignRankings: apiResponse!));
    } catch (e) {
      emit(RankingFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadStudentRanking(
      LoadStudentRanking event, Emitter<RankingState> emit) async {
    emit(StudentRankingLoading());
    try {
      var apiResponse = await storeRepository.fecthStudentRanking();

      emit(StudentRankingLoaded(studentRankings: apiResponse!));
    } catch (e) {
      emit(RankingFailed(error: e.toString()));
    }
  }
}
