import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kart24/controllers/provider.dart';
import 'package:path_provider/path_provider.dart';

class ReadFile extends StatefulWidget {
  const ReadFile({Key? key}) : super(key: key);

  @override
  State<ReadFile> createState() => _ReadFileState();
}

class _ReadFileState extends State<ReadFile> {
  bool _isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.red[700]!),
          title: const Text(
            "Read From File",
            style: const TextStyle(
              fontSize: 24,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(
          children: [
            _isDone
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red[700],
                    child: Text(
                      "Done Reading",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ))
                : SizedBox(),
            Expanded(
              child: Center(
                child: ElevatedButton(
                    onPressed: () => _readfromfile(),
                    child:
                        Text("Read from file", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[700],
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                        ))),
              ),
            ),
          ],
        ));
  }

  void _readfromfile() {
    readCounter().then((value) => Kart.getInstance.setprodJson(value));
    setState(() {
      _isDone = true;
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isDone = false;
      });
    });
    print("done reading");
  }
}

Future<String> get _localPath async {
  final directory = await getExternalStorageDirectories();

  return directory![0].path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  print(path);
  return File('$path/newprodJson.txt');
}

// Future<File> writeCounter(int counter) async {
//   final file = await _localFile;
//   print(file);
//   _localFile.then((value) => print(value));
//   return file.writeAsString('$counter');
// }

Future<String> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If encountering an error, return 0
    return "";
  }
}
