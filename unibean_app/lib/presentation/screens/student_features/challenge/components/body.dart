import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/in_process_challenge.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        //In process Challenge
        InProcessChallenge(),
        
        //complete Challenge
         InProcessChallenge(),

        //completed Challenge
         InProcessChallenge(),
      ],
    );
  }
}
