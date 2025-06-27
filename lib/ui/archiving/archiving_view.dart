import 'package:flutter/material.dart';
import 'package:planit/ui/common/view/default_layout.dart';

class ArchivingView extends StatelessWidget {
  const ArchivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: const Center(
        child: Text('아카이빙'),
      ),
    );
  }
}
