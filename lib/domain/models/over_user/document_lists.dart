part of 'over_user.dart';

class DocumetLists {
  List<Categories>? categories;
  String? name;

  DocumetLists({this.categories, this.name});

  DocumetLists.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}
