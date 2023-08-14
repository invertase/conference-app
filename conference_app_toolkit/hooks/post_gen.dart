import 'dart:io';
import 'package:mason/mason.dart';
import 'package:flutterfire_cli/src/command_runner.dart';
import 'package:flutterfire_cli/src/flutter_app.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  await Process.run('flutter', ['packages', 'get']);

  progress.complete();

  final prodProject = context.vars['prod_firebaseProject'];
  final devProject = context.vars['dev_firebaseProject'];

  await _runFlutterFireConfigure(context, prodProject);
  await _copyConfigFile(context, 'prod');

  await _runFlutterFireConfigure(context, devProject);
  await _copyConfigFile(context, 'dev');

  await _format(context);
}

/// Generate the Firebase config files for the given [projectId].
Future<void> _runFlutterFireConfigure(
  HookContext context,
  String projectId,
) async {
  context.logger.info('i Running FlutterFire configure...');

  final app = await FlutterApp.load(Directory.current);
  final flutterFire = FlutterFireCommandRunner(app);

  await flutterFire.run([
    'config',
    '--project',
    '$projectId',
    '--platforms',
    'android,ios',
  ]);

  context.logger.info('');

  context.logger.success(
    '✓ FlutterFire configure completed successfully for project $projectId 🚀',
  );

  context.logger.info('');
}

/// Copy the generated config file to the correct location based on the given [flavor].
Future<void> _copyConfigFile(HookContext context, String flavor) async {
  final done = context.logger.progress('Copying generated config...');

  // Copy the generated config file to the correct location
  final result = await Process.run('mv', [
    'lib/firebase_options.dart',
    'lib/firebase_options_$flavor.dart',
  ]);

  // Remove the generated config file from the root of the project
  await Process.run('rm', [
    '-rf',
    './lib/firebase_options.dart',
  ]);

  await Process.run('mkdir', [
    '-p',
    './ios/config/$flavor',
  ]);

  // Copy the generated iOS config file to the correct location
  await Process.run('mv', [
    'ios/Runner/GoogleService-Info.plist',
    'ios/config/$flavor/GoogleService-Info.plist',
  ]);

  await Process.run('mv', [
    'ios/firebase_app_id_file.json',
    'ios/config/$flavor/firebase_app_id_file.json',
  ]);

  await Process.run('mkdir', [
    '-p',
    './android/app/src/$flavor',
  ]);

  // Copy the generated Android config file to the correct location
  await Process.run('mv', [
    'android/app/google-services.json',
    'android/app/src/$flavor/google-services.json',
  ]);

  // Remove the generated config file from the root of the project
  await Process.run('rm', [
    '-rf',
    './ios/Runner/GoogleService-Info.plist',
  ]);

  await Process.run('rm', [
    '-rf',
    './android/app/google-services.json',
  ]);

  if (result.exitCode == 0) {
    done.complete('Files copied successfully');
  } else {
    done.fail(result.stderr.toString());
  }
}

/// Format the project files.
Future<void> _format(HookContext context) async {
  final done = context.logger.progress('Formatting files...');
  final result = await Process.run('dart', [
    'format',
    '.',
  ]);

  if (result.exitCode == 0) {
    done.complete('Files formatted successfully');
  } else {
    done.fail(result.stderr.toString());
  }
}
