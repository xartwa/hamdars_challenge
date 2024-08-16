class LessonModel {
  String? id;
  String? name;
  String? unitIcon;
  int? sumUserStudy;
  int? hamdarsUserUnitLevelIndex;
  int? hamdarsUserCurrentUnitLevelPoint;
  int? hamdarsUserMaxUnitLevelPoint;
  int? hamdarsUserMinUnitLevelPoint;
  List<HamdarsQUnitLearningContentDtos>? hamdarsQUnitLearningContentDtos;

  LessonModel(
      {this.id,
      this.name,
      this.unitIcon,
      this.sumUserStudy,
      this.hamdarsUserUnitLevelIndex,
      this.hamdarsUserCurrentUnitLevelPoint,
      this.hamdarsUserMaxUnitLevelPoint,
      this.hamdarsUserMinUnitLevelPoint,
      this.hamdarsQUnitLearningContentDtos});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unitIcon = json['unit_icon'];
    sumUserStudy = json['sum_user_study'];
    hamdarsUserUnitLevelIndex = json['hamdarsUserUnitLevelIndex'];
    hamdarsUserCurrentUnitLevelPoint = json['hamdarsUserCurrentUnitLevelPoint'];
    hamdarsUserMaxUnitLevelPoint = json['hamdarsUserMaxUnitLevelPoint'];
    hamdarsUserMinUnitLevelPoint = json['hamdarsUserMinUnitLevelPoint'];
    if (json['hamdarsQUnitLearningContentDtos'] != null) {
      hamdarsQUnitLearningContentDtos = <HamdarsQUnitLearningContentDtos>[];
      json['hamdarsQUnitLearningContentDtos'].forEach((v) {
        hamdarsQUnitLearningContentDtos!
            .add(HamdarsQUnitLearningContentDtos.fromJson(v));
      });
    }
  }

}

class HamdarsQUnitLearningContentDtos {
  String? hamdarsQUnitLearningContentTypeDesc;
  String? hamdarsQUnitLearningContentTypeURL;
  String? hamdarsQUnitLearningContentTypeIcon;
  String? hamdarsQUnitLearningContentTypeColor;

  HamdarsQUnitLearningContentDtos(
      {this.hamdarsQUnitLearningContentTypeDesc,
      this.hamdarsQUnitLearningContentTypeURL,
      this.hamdarsQUnitLearningContentTypeIcon,
      this.hamdarsQUnitLearningContentTypeColor});

  HamdarsQUnitLearningContentDtos.fromJson(Map<String, dynamic> json) {
    hamdarsQUnitLearningContentTypeDesc =
        json['hamdarsQUnitLearningContentTypeDesc'];
    hamdarsQUnitLearningContentTypeURL =
        json['hamdarsQUnitLearningContentTypeURL'];
    hamdarsQUnitLearningContentTypeIcon =
        json['hamdarsQUnitLearningContentTypeIcon'];
    hamdarsQUnitLearningContentTypeColor =
        json['hamdarsQUnitLearningContentTypeColor'];
  }


}
