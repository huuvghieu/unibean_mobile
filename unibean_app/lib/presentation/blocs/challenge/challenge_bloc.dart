import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final ChallengeRepository challengeRepository;

  ChallengeBloc({required this.challengeRepository}) : super(ChallengeInitial()) {
    on<LoadChallenge>(_onLoadChallenges);
  }

  Future<void> _onLoadChallenges(
      LoadChallenge event, Emitter<ChallengeState> emit) async {
    emit(ChallengeLoading());
    try {
      var apiResponse =
          await challengeRepository.fecthChallenges();
      emit(ChallengesLoaded(challenge: apiResponse!.result.toList()));
    } catch (e) {
      emit(ChallengeFailed(error: e.toString()));
    }
  }
}
