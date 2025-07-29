import 'dart:math';

import 'package:flutter/material.dart';

import '../../../theme/planit_colors.dart';
import '../../../theme/planit_typos.dart';
import '../../common/comopnent/planit_text.dart';

class RecoveryTimer extends StatelessWidget {
  final Animation<double> animation;
  final double radius;
  final int remainSeconds;

  const RecoveryTimer({
    super.key,
    required this.animation,
    required this.radius,
    required this.remainSeconds,
  });

  @override
  Widget build(BuildContext context) {
    // 연두색 원은 아래에 두고 애니메이션 적용된 Paniter가 위에 쌓이도록
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFFF1FFDB),
          radius: radius,
          child: PlanitText(
            _formatTime(remainSeconds),
            style: PlanitTypos.pretendardBold64.copyWith(
              color: PlanitColors.green,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) => CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: TimerPainter(
              progress: animation.value,
              radius: radius,
            ),
          ),
        ),
      ],
    );
  }
}

// Timer 위에 움직이는 선만 CustomPaint로 구현
class TimerPainter extends CustomPainter {
  final double progress;
  final double radius;

  TimerPainter({
    required this.progress,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 원 중심
    final center = Offset(size.width / 2, size.height / 2);
    // 12시 방향에서 시작
    const startingAngle = -0.5 * pi;

    final redArcRect = Rect.fromCircle(center: center, radius: radius);

    // 스타일 설정
    final redArcPaint = Paint()
      ..color = PlanitColors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawArc(
      redArcRect,
      startingAngle,
      progress * 2 * pi,
      false,
      redArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

String _formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  // 초가 한 자리일 때 앞에 0 추가
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutes:$secondsStr';
}
