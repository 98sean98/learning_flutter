import 'dart:io';
import 'dart:math';
import 'package:args/command_runner.dart';
import 'package:simple_cli/commands/now.dart';
import 'package:simple_cli/commands/week.dart';

Future<void> weatherCLI(List<String> args) async {
  final runner = CommandRunner('weather', 'dart weather cli');
  runner..addCommand(NowCommand())..addCommand(WeekCommand());

  return await runner.run(args).catchError((e) {
    stdout.write('${e ?? 'An error has occured'}');
    exitCode = -1;
  });
}
