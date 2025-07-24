import 'package:planit/repository/task/model/task_model.dart';

class PlanTemplate {
  final String title;
  final List<PlanTemplateDetail> templateDetails;

  PlanTemplate({required this.title, required this.templateDetails});
}

class PlanTemplateDetail {
  final String title;
  final String category;
  final String descriptionShort;
  final String descriptionLong;
  final List<TaskModel> tasks;

  PlanTemplateDetail(
      {required this.title,
      required this.category,
      required this.descriptionShort,
      required this.descriptionLong,
      required this.tasks});
}

class PlanTemplates {
  // 마음 정리
  static final PlanTemplate emotionPlanTemplate = PlanTemplate(
    title: '마음 정리',
    templateDetails: [
      PlanTemplateDetail(
        category: '마음 정리',
        title: '감정 리셋 루틴',
        descriptionShort: '감정 정리 루틴',
        descriptionLong: '감정이 복잡하거나 지칠 때, 잠깐 멈추고 나를 돌볼 수 있도록 도와주는 루틴이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '감정 일기 3줄 쓰기'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '심호흡 또는 명상 3분'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '나에게 다정한 말 적기'),
        ],
      ),
      PlanTemplateDetail(
        category: '마음 정리',
        title: '스트레스 해소 플랜',
        descriptionShort: '휴식 중심 루틴',
        descriptionLong: '몸과 마음에 쌓인 긴장을 가볍게 풀 수 있는 휴식 중심의 플랜이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '걱정되는 일 1개 정리'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '따뜻한 음료 마시기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '가벼운 산책 10분'),
        ],
      ),
      PlanTemplateDetail(
        category: '마음 정리',
        title: '혼자만의 시간 루틴',
        descriptionShort: '혼자만의 휴식 루틴',
        descriptionLong: '혼자 있고 싶은 날, 나만의 공간을 회복할 수 있도록 도와주는 루틴이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'SLOW', title: '좋아하는 장소 1곳 가기'),
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '스마트폰 없이 혼자 식사하기'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '감정 정리 메모장 쓰기'),
        ],
      ),
    ],
  );

  // 재정
  static final PlanTemplate financePlanTemplate = PlanTemplate(
    title: '재정',
    templateDetails: [
      PlanTemplateDetail(
        category: '재정',
        title: '충동구매 제어 플랜',
        descriptionShort: '소비 습관 점검 루틴',
        descriptionLong: '계획에 없던 지출을 줄이고, 소비 습관을 돌아보는 연습용 플랜이에요.',
        tasks: [
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '사고 싶은 물건 캡처만 하기'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '당일 비필수 소비 안 하기'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '3일 후 다시 생각하기'),
        ],
      ),
      PlanTemplateDetail(
        category: '재정',
        title: '가계부 기록 루틴',
        descriptionShort: '소비 기록 플랜',
        descriptionLong: '하루의 소비를 돌아보고 기록하며 돈의 흐름을 파악해볼 수 있어요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'ALL', title: '오늘 쓴 돈 기록하기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '소비 항목별 분류하기'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '일주일 지출 합계 보기'),
        ],
      ),
      PlanTemplateDetail(
        category: '재정',
        title: '월 예산 미리 짜기 플랜',
        descriptionShort: '예산 설정 플랜',
        descriptionLong: '이번 달에는 돈 걱정 줄이고 싶다면, 이 플랜으로 예산부터 차근차근 준비해보세요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'SLOW', title: '고정지출 목록 업데이트'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '한도 내 예산 설정'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '여유자금 목표 설정'),
        ],
      ),
    ],
  );

  // 관계
  static final PlanTemplate relationshipPlanTemplate = PlanTemplate(
    title: '관계',
    templateDetails: [
      PlanTemplateDetail(
        category: '관계',
        title: '안부 루틴 플랜',
        descriptionShort: '가벼운 소통 루틴',
        descriptionLong: '바쁘더라도 소중한 사람들과 가볍게 마음을 나눌 수 있는 루틴이에요.',
        tasks: [
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '친구에게 이모티콘 하나 보내기'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '가족 단톡방에 댓글 달기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '연락하고 싶은 사람 목록 정리'),
        ],
      ),
      PlanTemplateDetail(
        category: '관계',
        title: '깊은 대화 시도 플랜',
        descriptionShort: '의미 있는 관계 강화 루틴',
        descriptionLong: '의미 있는 대화를 통해 관계를 조금 더 가까이 이어가고 싶은 분들께 추천해요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'ALL', title: '“요즘 어때?” 질문 해보기'),
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '대화 후 느낀 점 짧게 적기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '상대 관심사 하나 알아보기'),
        ],
      ),
      PlanTemplateDetail(
        category: '관계',
        title: '디지털 디톡스 소셜 플랜',
        descriptionShort: 'SNS 줄이고 진짜 연결 루틴',
        descriptionLong: 'SNS 사용을 줄이고, 진짜 사람들과의 연결에 집중할 수 있는 플랜이에요.',
        tasks: [
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: 'SNS 대신 전화 또는 문자하기'),
          TaskModel(taskId: -99, taskType: 'ALL', title: 'SNS 총 사용시간 30분 이내'),
          TaskModel(
              taskId: -99, taskType: 'SLOW', title: '오늘 본 콘텐츠 중 기억에 남는 것 적기'),
        ],
      ),
    ],
  );

  // 운동
  static final PlanTemplate exercisePlanTemplate = PlanTemplate(
    title: '운동',
    templateDetails: [
      PlanTemplateDetail(
        category: '운동',
        title: '다이어트',
        descriptionShort: '식단 + 운동 병행 플랜',
        descriptionLong: '식단 관리와 가벼운 유산소 운동으로 구성된 건강한 다이어트 플랜입니다.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'ALL', title: '아침 식단 기록하기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '30분 산책하기'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '저녁 과식 피하기'),
        ],
      ),
      PlanTemplateDetail(
        category: '운동',
        title: '일상운동',
        descriptionShort: '걷기/스트레칭 중심 플랜',
        descriptionLong: '큰 결심 없이도 일상 속에서 가볍게 몸을 움직일 수 있는 루틴이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '아침 스트레칭 5분'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '점심시간 걷기 15분'),
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '자기 전 폼롤러 스트레칭'),
        ],
      ),
      PlanTemplateDetail(
        category: '운동',
        title: '근력운동',
        descriptionShort: '헬스장 기반 루틴',
        descriptionLong: '헬스장에 가는 날, 무엇을 할지 고민하지 않도록 구성한 기본 운동 루틴이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'SLOW', title: '오늘 운동 루틴 미리 정하기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '상체 or 하체 3세트 수행'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '마무리 유산소 10분'),
        ],
      ),
    ],
  );

  // 자기계발
  static final PlanTemplate selfGrowthPlanTemplate = PlanTemplate(
    title: '자기계발',
    templateDetails: [
      PlanTemplateDetail(
        category: '자기계발',
        title: '아침 루틴',
        descriptionShort: '가벼운 아침 습관 플랜',
        descriptionLong: '하루를 더 잘 보내고 싶은 분들을 위한, 가벼운 아침 습관 모음이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'SLOW', title: '7시 이전 기상하기'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '10분 독서하기'),
          TaskModel(taskId: -99, taskType: 'PASSIONATE', title: '당일 목표 1줄로 쓰기'),
        ],
      ),
      PlanTemplateDetail(
        category: '자기계발',
        title: '저녁 회고',
        descriptionShort: '하루 마무리 루틴',
        descriptionLong: '바쁜 하루를 마무리하며 나를 돌아보고 정리할 수 있는 저녁 루틴이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'ALL', title: '오늘 잘한 일 1개 적기'),
          TaskModel(taskId: -99, taskType: 'SLOW', title: '내일 우선순위 정하기'),
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '스마트폰 끄고 30분 전 취침'),
        ],
      ),
      PlanTemplateDetail(
        category: '자기계발',
        title: '일일 성장 미션',
        descriptionShort: '꾸준한 자기계발 미션',
        descriptionLong: '작지만 꾸준한 자기계발을 위한 하루 한 가지 성장 미션 플랜이에요.',
        tasks: [
          TaskModel(taskId: -99, taskType: 'SLOW', title: 'TED 영상 1편 보기'),
          TaskModel(
              taskId: -99, taskType: 'PASSIONATE', title: '인사이트 요약 1줄 작성'),
          TaskModel(taskId: -99, taskType: 'ALL', title: '관심 직무 기사 1개 탐색'),
        ],
      ),
    ],
  );
}
