import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  final ChallengeRepository challengeRepository;
  final StudentRepository studentRepository;

  ChallengeBloc(
      {required this.challengeRepository, required this.studentRepository})
      : super(ChallengeInitial()) {
    on<LoadChallenge>(_onLoadChallenges);
    on<ClaimChallengeStudentId>(_onClaimChallenge);
  }

  Future<void> _onLoadChallenges(
      LoadChallenge event, Emitter<ChallengeState> emit) async {
    emit(ChallengeLoading());
    try {
      var apiResponse = await challengeRepository.fecthChallenges();
      emit(ChallengesLoaded(challenge: apiResponse!.result.toList()));
    } catch (e) {
      emit(ChallengeFailed(error: e.toString()));
    }
  }

  Future<void> _onClaimChallenge(
      ClaimChallengeStudentId event, Emitter<ChallengeState> emit) async {
    try {
      var isSuccess = await studentRepository.postChallengeStudentId(
          challengeId: event.challengeId, studentId: event.studentId);
      if (isSuccess!) {
        var apiResponse = await challengeRepository.fecthChallenges();
        emit(ChallengesLoaded(
            challenge: apiResponse!.result.toList(), isClaimed: true));
      } else {
        emit(ChallengeFailed(error: 'Failed'));
      }
    } catch (e) {
      emit(ChallengeFailed(error: e.toString()));
    }
  }
}
