import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/is_claimed_challenge.dart';

import 'in_process_challenge.dart';
import 'is_completed_challenge.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //In process Challenge
        InProcessChallenge(),

        //complete Challenge
        IsCompletedChallenge(),

        //completed Challenge
        IsClaimedChallenge()
      ],
    );
  }
}
