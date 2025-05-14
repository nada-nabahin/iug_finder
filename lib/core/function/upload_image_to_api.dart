import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future uploadPhotoToAPI(File photo) async {
  return MultipartFile.fromFile(
    photo.path,
    filename: photo.path.split('/').last,
  );
}

Future<File> urlToFile(String imageUrl) async {
  // Generate a temporary file name
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;
  final file = File('$tempPath/${DateTime.now().millisecondsSinceEpoch}.jpg');

  // Download the image
  final response = await http.get(Uri.parse(imageUrl));
  await file.writeAsBytes(response.bodyBytes);

  return file;
}
