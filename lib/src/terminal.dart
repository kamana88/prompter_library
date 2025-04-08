// Knows how to print questions to the terminal + receive input
/* Methods
   printPrompt
   printOptions
   collectInput
   clearScreen
*/

import 'dart:io' show Platform, stdout, stdin;
// Namespace syntax import 'dart:io' as io; io.BytesBuilder();
import 'option.dart';

class Terminal {
  const Terminal();

  void printPrompt(String prompt) {
    // **stdout** instance of Stdout Class, sends information to the terminal
    // *writeln* Clears the terminal and adds a new line
    stdout.writeln(prompt);
  }

  void printOptions(List<Option> options) {
    /*for (var i = 0; i < options.length; i++) {
      stdout.writeln('[$i] - ${options[i].label}');
    }*/

    options.asMap().forEach((index, option) {
      stdout.writeln('[$index] - ${option.label}');
    });

    stdout.writeln('Enter a choice: \n');
    stdout.write('>');
  }

  String? collectInput() {
    // *stdin* Receives information from the terminal
    return stdin.readLineSync();
  }

  void clearScreen() {
    if (Platform.isWindows) {
      // *write* Clears the terminal
      stdout.write('\x1B[2J\x1B[0f');
    } else {
      stdout.write('\x1B[2J\x1B[3J\x1B[H');
    }
  }
}
