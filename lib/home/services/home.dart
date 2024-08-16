import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../models/lesson.dart';

class HomeServices {
  final Dio _httpClient = GetIt.instance<Dio>();

  Future<List<LessonModel>> fetchLessonData() async {
    try {
      var response = await _httpClient.get('test_unit');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<dynamic> data = response.data;
        var finalResponse =
            data.map((item) => LessonModel.fromJson(item)).toList();
        return finalResponse;
      } else {
        throw Exception('Failed to load lesson data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
