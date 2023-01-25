// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aplication_name":
            MessageLookupByLibrary.simpleMessage("Over Money Manager"),
        "auth_title": MessageLookupByLibrary.simpleMessage("Authorization"),
        "confirm_form_title":
            MessageLookupByLibrary.simpleMessage("Verify phone number"),
        "confirm_title": MessageLookupByLibrary.simpleMessage("SMS sent"),
        "confirm_txt": MessageLookupByLibrary.simpleMessage("Сonfirm"),
        "continue_txt": MessageLookupByLibrary.simpleMessage("Сontinue"),
        "exeption_title":
            MessageLookupByLibrary.simpleMessage("An error has occurred"),
        "google_button":
            MessageLookupByLibrary.simpleMessage("Log In with Googlululu"),
        "has_account_error":
            MessageLookupByLibrary.simpleMessage("This account already exists"),
        "input_name": MessageLookupByLibrary.simpleMessage("Name:"),
        "log_in": MessageLookupByLibrary.simpleMessage("Log In"),
        "not_found_account": MessageLookupByLibrary.simpleMessage(
            "No account found with this phone number!!!"),
        "registr": MessageLookupByLibrary.simpleMessage("Registr")
      };
}
