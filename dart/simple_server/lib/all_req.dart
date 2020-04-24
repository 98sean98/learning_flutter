import 'dart:async';
import 'dart:io';

Future serveAllRequests(File file, HttpRequest req) async {
  if (await file.exists()) {
    print('severing ${file.path}');
    req.response.headers.contentType = ContentType.html;

    try {
      await file
          .openRead()
          .pipe(req.response); // open the file stream and pipe to response

    } catch (e) {
      print('could not read file: $e');
      exit(-1);
    }
  } else {
    print('can\'t open file');
    req.response.statusCode = HttpStatus.notFound;
    await req.response.close();
  }
}
