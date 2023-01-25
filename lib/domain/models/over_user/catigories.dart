part of 'over_user.dart';

class Categories {
  List<Expenses>? expenses;
  String? name;

  Categories({this.expenses, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['Expenses'] != null) {
      expenses = <Expenses>[];
      json['Expenses'].forEach((v) {
        expenses!.add(Expenses.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (expenses != null) {
      data['Expenses'] = expenses!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}
