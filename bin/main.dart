import 'package:flutter_weather/flutter_weather.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future main() async {
  final app = Application<FlutterWeatherChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;
  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print('Connected to database');
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}