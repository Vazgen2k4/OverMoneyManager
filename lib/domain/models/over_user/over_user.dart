part 'document_lists.dart';
part 'catigories.dart';
part 'expenses.dart';

class OverUser {
  List<DocumetLists>? lists;
  String? tableId;
  String? phone;
  String? name;

  OverUser({this.lists, this.tableId, this.phone, this.name});

  OverUser.fromJson(Map<String, dynamic>? json) {
    if (json?['lists'] != null) {
      lists = <DocumetLists>[];
      json?['lists'].forEach((v) {
        lists!.add(DocumetLists.fromJson(v));
      });
    }
    tableId = json?['table_id'];
    phone = json?['phone'];
    name = json?['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (lists != null) {
      data['lists'] = lists!.map((v) => v.toJson()).toList();
    }
    data['table_id'] = tableId;
    data['phone'] = phone;
    data['name'] = name;
    return data;
  }

  OverUser copyWith({
    List<DocumetLists>? lists,
    String? tableId,
    String? phone,
    String? name,
  }) {
    return OverUser(
      lists: lists ?? this.lists,
      tableId: tableId ?? this.tableId,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    String _str =
        '\nИмя: $name\nId - таблицы: $tableId\nЛисты: ${lists?.length ?? 0}';

    lists?.forEach((el) {
      _str += '\n |';
      _str += '\n |--\'${el.name}\'';
      final cats = el.categories ?? [];
      for (var cat in cats) {
        _str += '\n |   |';
        _str += '\n |   |--<${cat.name}>';
        final exps = cat.expenses ?? [];
        for (var ex in exps) {
          final _d = DateTime.fromMillisecondsSinceEpoch((ex.date ?? 0) * 1000);
          _str += '\n |   |   |';
          _str += '\n |   |   |--{${ex.descr}}';
          _str += '\n |   |   |--{${ex.price}}';
          _str += '\n |   |   |--{$_d}';
        }
      }
    });

    return _str;
  }
}
