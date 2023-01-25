import 'package:gsheets/gsheets.dart';

abstract class GSheetsApi {
  static const tableCred = r'''
{
  "type": "service_account",
  "project_id": "over-money-manager",
  "private_key_id": "d47d016799ff389b0192790aec16214a817ade1a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCJIq31UQNpjBr0\nn25hJnqcUW6DE2+MDsJnY00whLypZ3t0aIK9i57U/+VwO4Tmt0ppbS6kty5k6Ila\n7GIGhGI9vF0ay4yDbqCae6h3MBrUQxTawueZVMAGEsnhCBB3wrJTpKhMF0f0Tuks\n6avrTRrMHQFO052QwcxucWWaLQpMgSSYRwInni6o17whwLUEmPjO6KMMtr1KMjcj\nVLGGePilnVvuRnatFjOySe5NlRtrUipTKXuAiQ4oSkD92z/ElD7DSArD31I52Ca9\njPkn2pSZk/riFeMkdZ4prZpHpqNkA6lQ5RAF22dV0R8JuGKNQ7u3YEgXHvksugWC\ny68suj11AgMBAAECggEACAsN1ezAUlFNMW96a1305LSNUp3HYJkVrjevoCVg5V9e\n6SHKF/Ds9MQ6LPN+D4QiQVMN4HZSqnN4aZSiCTd8MEUbLDD9FvuxlW35oF1PbYdZ\nB/L/ih7jkQJKxJU9q1sy119kdEC3T9fNqvyHlf+fOefc8EZ5dYiQWM1I2W/ugd8e\njjbzfsJ6mCewb7L5JuVVXkZ5CNDcPrBI5GP++ZiJB7ByzIWpzMuiUB6Tle07l9IL\nFU6X1hKMUSjtrsJm7DrRQhoerWngka2njYcNi+5YqW9yj+vaeq3KA5/YkypPVyye\nALMV9dRpgHiDSZu4bmz/Pxsz1T8uwZ9jvpiSer+3QQKBgQC/eq+heLlSQ2+o4ttC\nCf1PyX6E+FRQ4cKUxfi+dKuAGwfGViPKvoWpxqtUEyajbaBB1MtmyR7Qt+ZZ45dt\n45gKvlm9pydq7TkC4JOk6htYilX4YfAxKwxJbnHR/uicKClXSAMLoKkj/hktw0w3\n1iNNAbbkPjYTgqAaN+3MM2IvoQKBgQC3WDXLX6y/t0AZDvYWPzULiau+ET0zdidb\nR44Y50cYu65h8qLxviO6ofS8cw3DkUtIoT4/YpL2VzAcAQG31yr36v+LDFHq5zJm\nX6AXSsCVJt3tlfQNKKsp25PFJzd+2UmQc4as6+0IQ9ZfZsooxjG2/0qk60d9ytB9\nexYdRa1NVQKBgC79WaqDqN8CQ52rhmkvcGWrKgxRsMdkj87YwpFiqk+20nKe4wu3\nM7AVXCg2xu2mUoS1RvFDe/d2meYHTzsddkt0qSs8oRTBgJMvL6xx8yIIWM6qojo+\nuTYwD2icaNMhm/uaZXzuAXQewGkVm1e8ik80k4Bxr+2bydSFUysglQDhAoGARZ7T\nXpTIDkzRpDJQNAZwaB8w/g2hxcbaDwlO5hn8n2G1SDBQu6dN/fK98klmMpsbkUrZ\nTkxqLezRsfCX7G1iPZ4Yx344JREBzGoHapDSLFED+NH2SIDm7hAZPsYzhpGQI7Aa\ntdMowPixkKyBm5YXDrxGZfWJwjSfkuaIcTkiI7kCf38D41tmFXss9wKj2L0OkgO8\nIOQgiM6U8m8LqnleN7UG9MKrv1jnK1aQ9MmnuclhjB7FkI14pRfjdJrUqXqS7Rj3\nUJmNbVZ6pw//OZGyJvHqi5eC0nymUhy+XxCq7831glFozaJQe+41G7U2e465HRBJ\nzgI3H+6WxUm8SN29+dw=\n-----END PRIVATE KEY-----\n",
  "client_email": "over-web-money-manager@over-money-manager.iam.gserviceaccount.com",
  "client_id": "107431380923846231770",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/over-web-money-manager%40over-money-manager.iam.gserviceaccount.com"
}
''';
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