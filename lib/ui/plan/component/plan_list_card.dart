import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_chip.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/common/const/planit_chips_style.dart';
import 'package:planit/ui/plan/plan_detail_view.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class planListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int routinNum;
  final int dDay;
  final String imagePath;

  const planListCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.dDay,
    required this.imagePath,
    required this.routinNum,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanDetailView(),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: PlanitColors.white02,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: 360,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(imagePath),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlanitText(title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    PlanitText(subtitle,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: PlanitColors.black02)),
                    PlanitText('$routinNum개 루틴',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: PlanitColors.black02))
                  ],
                ),
              ),
              PlanitChip(chipColor: PlanitChipColor.black, label: 'D-$dDay'),
              SizedBox(
                width: 20,
              ),
            ],
          )),
    );
  }
}
