import 'package:gsheets/gsheets.dart';

abstract class GSheetsApi {
  static const tableCred = '';
  static const tableId = '1Y-N-B17SecEn_t9Etx7rstNVAYfeN50W3cCTzJZ0-48';
  // Подключение к таблицам
  static final _gsheets = GSheets(tableCred);
  static Worksheet? _userSheets;
  // Названия листа который мы инициализировали
  static const _usersWorkSheetsTitle = 'expenses';

  static void initShets() async {
    // Таблица которую мы получили
    final Spreadsheet readShets = await _gsheets.spreadsheet(tableId);
    // Лист в таблице который мы либо создали, либо получили
    _userSheets = await checkTable(_usersWorkSheetsTitle, ss: readShets);
    // Создаем начальную таблицу
    await createTable();
  }

  static Future<void> createTable() async {
    final us = _userSheets;
    if (us == null) return;

    const List<String> _firstRow = [
      'Расходы',
      'Бюджет',
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];

    await us.values.insertRow(1, _firstRow);
  }

  static Future<Worksheet?> checkTable(
    String title, {
    required Spreadsheet ss,
  }) async {
    final item = ss.sheets.map<bool>((sheet) => sheet.title == title).first;

    if (!item) {
      return ss.addWorksheet(title);
    }
    return ss.worksheetByTitle(title);
  }
}
