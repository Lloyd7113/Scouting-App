import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

List<String> Row1 = List<String>(36);
List<String> Row2 = List<String>(36);
List<String> Row3 = List<String>(36);
List<String> Row4 = List<String>(36);
List<String> Row5 = List<String>(36);
List<String> Row6 = List<String>(36);
List<List<String>> data = List<List<String>>();

void startUp(){

}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.csv');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    String contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If we encounter an error, return 0
    return 0;
  }
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$counter');
}