import 'package:flutter/material.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      // TODO(창민): child 부터 수정하여 구현해주시면 됩니다!
      child: const Center(
        child: Text('플랜'),
      ),
    );
  }
}
