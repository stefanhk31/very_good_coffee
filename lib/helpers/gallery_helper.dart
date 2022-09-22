import 'package:gallery_saver/gallery_saver.dart';

class GalleryHelper {
  Future<bool?> saveImage(String url) async {
    try {
      var result = await GallerySaver.saveImage(url);
    } catch (e) {
      print(e);
    }
  }
}
