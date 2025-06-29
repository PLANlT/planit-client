import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planit/theme/planit_colors.dart';
import 'package:planit/ui/common/comopnent/planit_text.dart';
import 'package:planit/ui/plan/plan_detail/plan_more_bottom_sheet.dart';

class todoCard extends StatelessWidget {
  final String title;
  final List<String> iconPaths;

  const todoCard({super.key, required this.title, required this.iconPaths});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: PlanitColors.white02),
        width: 320,
        height: 56,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: PlanitText(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            for (var iconPath in iconPaths)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SvgPicture.asset(iconPath, width: 20, height: 20),
              ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PlanMoreBottomSheet();
                    },
                  );
                },
                child: SvgPicture.asset('assets/icons/more.svg')),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}

