import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'bonus_event.dart';
part 'bonus_state.dart';

class BonusBloc extends Bloc<BonusEvent, BonusState> {
  final BonusRepository bonusRepository;
  BonusBloc(this.bonusRepository) : super(BonusInitial()) {
    on<LoadBonus>(_onLoadBonus);
  }

  Future<void> _onLoadBonus(LoadBonus event, Emitter<BonusState> emit) async {
    emit(BonusLoading());
    try {
      var apiResponse = await bonusRepository.fecthBonuses(
          page: event.page, limit: event.limit);
      emit(BonusesLoaded(bonuses: apiResponse!.result.toList()));
    } catch (e) {
      emit(BonusesFailed(error: e.toString()));
    }
  }
}
