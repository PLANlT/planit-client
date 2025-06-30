class PlanOverviewModel {
  final String title;
  final String subtitle;
  final int routinNum;
  final int? dDay;
  final String imagePath;

  PlanOverviewModel(
      {required this.title,
      required this.subtitle,
      required this.routinNum,
      this.dDay,
      required this.imagePath});
}
