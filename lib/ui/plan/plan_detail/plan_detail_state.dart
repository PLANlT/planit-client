import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planit/core/loading_status.dart';
import 'package:planit/repository/plan/model/plan_detail_model.dart';
import 'package:planit/repository/task/model/task_model.dart';
import 'package:planit/repository/plan/model/plan_model.dart';

part 'plan_detail_state.freezed.dart';

@freezed
abstract class PlanDetailState with _$PlanDetailState {
  const factory PlanDetailState({
    PlanDetailModel? planDetail,  //이렇게 해도 되는 지 물어보기
    @Default(LoadingStatus.none) LoadingStatus loadingStatus,
    @Default('') String errorMessage,
  }) = _PlanDetailState;
}
