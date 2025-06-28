import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/core/repository_result.dart';
import 'package:planit/repository/main/model/main_plan_model.dart';
import 'package:planit/ui/main/component/task_widget.dart';

final AutoDisposeProvider<MainRepository> mainRepositoryProvider =
    Provider.autoDispose<MainRepository>(
  (ref) => MainRepository(),
);

class MainRepository {
  const MainRepository();

  Future<RepositoryResult<List<MainPlanModel>>> getMainPlanList() async {
    // API 구현이 안 되어 있어, 임의 데이터 반환
    await Future.delayed(Duration(seconds: 1));

    return SuccessRepositoryResult(
      data: [
        MainPlanModel(
          planTitle: '목표를 가운데에 놓고 스위치 목표를 가운데에 놓고 스위치',
          tasks: [
            TempTaskModel(
              isCompleted: true,
              task: '목표를 가운데에 놓고 스위치',
            ),
            TempTaskModel(
              isCompleted: true,
              task: '목표를 가운데에 놓고 스위치',
            ),
            TempTaskModel(
              isCompleted: false,
              task: '목표를 가운데에 놓고 스위치 목표를 가운데에 놓고 스위치 목표를 가운데에 놓고 스위치',
            ),
          ],
          dDay: 32,
        ),
        MainPlanModel(
          planTitle: '스파이에어 띵곡 모음',
          tasks: [
            TempTaskModel(
              isCompleted: false,
              task: '마이 월드',
            ),
            TempTaskModel(
              isCompleted: false,
              task: '라이어',
            ),
            TempTaskModel(
              isCompleted: true,
              task: '사무라이 하트',
            ),
            TempTaskModel(
              isCompleted: false,
              task: '비 그친 뒤 피어나는 꽃',
            ),
            TempTaskModel(
              isCompleted: true,
              task: '라스트 모멘트',
            ),
            TempTaskModel(
              isCompleted: true,
              task: '감정불화',
            ),
            TempTaskModel(
              isCompleted: true,
              task: '웬디 이츠 유',
            ),
          ],
        ),
      ],
      // data: []
    );
  }
}
