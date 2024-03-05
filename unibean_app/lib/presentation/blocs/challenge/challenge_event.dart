part of 'challenge_bloc.dart';

sealed class ChallengeEvent extends Equatable {
  const ChallengeEvent();
}


final class LoadChallenge extends ChallengeEvent {

  @override
  List<Object?> get props => [];
}