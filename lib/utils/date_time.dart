import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// String을 DateTime으로 변환
DateTime? stringToDateTime(String dateString) {
  try {
    return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(dateString);
  } catch (e) {
    debugPrint('String to DateTime 실패: $e');
    return null;
  }
}
