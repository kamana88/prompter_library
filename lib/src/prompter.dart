// Tie between the Terminal and Option. Takes a list of options and gets the
// terminal to print them out.

import 'option.dart';
import 'terminal.dart';

// instance of terminal created once when we call *ask*
// Cannot be reassigned a value
final Terminal _terminal = const Terminal();

class Prompter {
  bool askBinary(String prompt) {
    final input = _ask('$prompt (y/n)', []);
    return input!.contains('y');
  }

  askMultiple(String prompt, List<Option> options) {
    final input = _ask(prompt, options);

    try {
      return options[int.parse(input!)].value;
    } on Exception {
      return askMultiple(prompt, options);
    }
  }

  String? _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);

    return _terminal.collectInput();
  }
}
