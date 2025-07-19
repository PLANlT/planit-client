import 'package:planit/data_source/mypage/response_body/my_info_response_body.dart';

class MyInfoModel {
  final String email;
  final String name;
  final String signType;
  final String createdAt;

  MyInfoModel({
    required this.email,
    required this.name,
    required this.signType,
    required this.createdAt,
  });

  MyInfoModel.fromResponse(MyInfoResponseBody response)
      : email = response.email,
        name = response.name,
        signType = getSignType(response.signType),
        createdAt = response.createdAt;
}

String getSignType(String provider) {
  return switch (provider) {
    'GOOGLE' => 'Google',
    'KAKAO' => 'Kakao',
    'NAVER' => 'Naver',
    _ => ''
  };
}
