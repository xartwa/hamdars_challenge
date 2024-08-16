import 'dart:math';

class Chapter {
  String lessonUuid;
  String title;
  Duration duration;
  double progress;

  Chapter({
    required this.lessonUuid,
    required this.title,
    required this.duration,
    required this.progress,
  });

  static List<Chapter> generateChapters() {
    List<Chapter> chapters = [];
    Random random = Random();

    Map<String, String> uuidToTitle = {
      "c3eb3018": "حسابان",
      "16d52c15": "فارسی",
      "a78d9e2b": "دین و زندگی",
      "397a501c": "عربی، زبان قرآن",
      "dba95c37": "فیزیک (رشته ریاضی)",
      "e0911078": "شیمی",
      "4355f58c" :"هندسه " ,
      "993f7581" : "حسابان",
      "c9f16ce8" : "ریاضیات گسسته",
      "0e27fbb1" : "انگلیسی"
      

    };

    uuidToTitle.forEach((uuid, title) {
      for (int i = 1; i <= 8; i++) { 
        chapters.add(
          Chapter(
            lessonUuid: uuid.split('-').first,
            title: "$title - فصل $i",
            duration: Duration(minutes: random.nextInt(20) + 5), 
            progress: random.nextDouble(), 
          ),
        );
      }
    });

    return chapters;
  }

  static List<Chapter> filterChaptersByUuid(String uuid) {
    return generateChapters().where((chapter) => chapter.lessonUuid == uuid.split('-').first).toList();
  }
}
