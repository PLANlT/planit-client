import 'package:flutter/material.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: const Center(
        child: Text('메인'),
      ),
    );
  }
}
