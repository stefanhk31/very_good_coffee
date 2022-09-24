import 'package:gallery_saver/gallery_saver.dart';

class GalleryHelper {
  Future<bool?> saveImage(String url) async {
    if (url.isEmpty) {
      throw Future.error('No image.');
    }

    try {
      await GallerySaver.saveImage(url);
    } on Error {
      throw Future.error('Could not save to gallery.');
    }
    return true;
  }
}
