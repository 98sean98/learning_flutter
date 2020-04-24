import 'dart:async';
import 'dart:io';

import 'package:simple_server/all_req.dart';

final File file = File('index.html');

Future main() async {
  HttpServer server;
  try {
    server = await HttpServer.bind('127.0.0.1', 8080);
  } catch (e) {
    print('failed to start server: $e');
    exit(-1); // exit the program
  }

  print('listening on localhost: ${server.port}'); // port 8080

  await for (var req in server) {
//    await serveAllRequests(file, req);

    var response = req.response..headers.contentType = ContentType.html;

    if (req.method == 'GET') {
      var fileName;
      if (req.uri.pathSegments.isEmpty) {
        fileName = 'index';
      } else {
        fileName = req.uri.pathSegments.last;
      }
      if (!fileName.contains('html')) {
        fileName += '.html';
      }

      var file = File(fileName);
      if (!await file.exists()) {
        file
            .openWrite(mode: FileMode.write)
            .write('<h1>This is a new file</h1>');
      }
      await file.openRead().pipe(response);
    }
  }
}
