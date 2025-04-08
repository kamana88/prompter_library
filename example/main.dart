import '../lib/prompter_bkw.dart';

void main() {
  final options = [
    new Option('I want red', '#f00'),
    new Option('I want blue', '#00f'),
  ];

  final prompter = new Prompter();

  String colorCode = prompter.askMultiple('Select a Color', options);
  bool answer = prompter.askBinary('Do you like this library?');

  print(colorCode);
  print(answer);
}
