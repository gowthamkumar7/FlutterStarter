import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class DownloadJson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Downloader();
  }
}

class Downloader extends State<DownloadJson> {
  var imageUrl =
      "Replace it with your url";
  bool downloading = true;
  String downloadingStr = "No data";
  double download = 0.0;
  File f;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Downloader Example"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("This Screen will download the data!"),
            ElevatedButton(
                onPressed: () {
                  _downloadFile();
                },
                child: Text("Download the data"))
          ],
        ),
      ),
    ));
  }

  void _downloadFile() async {
    var status = await Permission.storage.status;
    print("HEre");
    if (status.isGranted) {
      Dio dio = Dio();
      var dir = await getApplicationDocumentsDirectory();
      f = File("${dir.path}/package.json");
      String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
      dio.download(imageUrl, "${dir.path}/$fileName",
          onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          download = (rec / total) * 100;
          print(fileName);
          downloadingStr =
              "Downloading Image : " + (download).toStringAsFixed(0);
          print(dir.path + "" + fileName);
        });
      });
    } else {
      Permission.storage.request();
    }
  }
}
