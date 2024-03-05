part of 'challenge_bloc.dart';

sealed class ChallengeState extends Equatable {
  const ChallengeState();
}

final class ChallengeInitial extends ChallengeState {
  @override
  List<Object> get props => [];
}

final class ChallengeLoading extends ChallengeState {
  @override
  List<Object> get props => [];
}

final class ChallengesLoaded extends ChallengeState {
  final List<ChallengeModel> challenge;

  ChallengesLoaded({required this.challenge});
  @override
  List<Object> get props => [challenge];
}

final class ChallengeFailed extends ChallengeState {
  final String error;

  ChallengeFailed({required this.error});

  @override
  List<Object> get props => [error];
}
