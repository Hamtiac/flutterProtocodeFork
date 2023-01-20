import 'dart:io';
import 'package:image/image.dart';
import 'package:test/test.dart';

import 'paths.dart';

void main() {
  group('JPEG', () {
    test('progressive', () {
      final fb = File('test/res/jpg/progress.jpg').readAsBytesSync();
      final image = JpegDecoder().decodeImage(fb)!;
      expect(image.width, 341);
      expect(image.height, 486);
    });

    final dir = Directory('test/res/jpg');
    final files = dir.listSync(recursive: true);
    for (var f in files.whereType<File>()) {
      if (!f.path.endsWith('.jpg')) {
        continue;
      }

      final name = f.path.split(RegExp(r'(/|\\)')).last;
      test(name, () {
        final List<int> bytes = f.readAsBytesSync();
        expect(JpegDecoder().isValidFile(bytes), equals(true));

        final image = JpegDecoder().decodeImage(bytes)!;
        final outJpg = JpegEncoder().encodeImage(image);
        File('$tmpPath/out/jpg/$name')
          ..createSync(recursive: true)
          ..writeAsBytesSync(outJpg);

        // Make sure we can read what we just wrote.
        final image2 = JpegDecoder().decodeImage(outJpg)!;

        expect(image.width, equals(image2.width));
        expect(image.height, equals(image2.height));
      });
    }

    for (var i = 1; i < 9; ++i) {
      test('exif/orientation_$i/landscape', () {
        final image = JpegDecoder().decodeImage(
            File('test/res/jpg/landscape_$i.jpg').readAsBytesSync())!;
        File('$tmpPath/out/jpg/landscape_$i.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(JpegEncoder().encodeImage(image));
      });

      test('exif/orientation_$i/portrait', () {
        final image = JpegDecoder().decodeImage(
            File('test/res/jpg/portrait_$i.jpg').readAsBytesSync())!;
        File('$tmpPath/out/jpg/portrait_$i.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(JpegEncoder().encodeImage(image));
      });

      test('file size', () {
        final origFileBytes = File('test/res/jpg/big_buck_bunny.jpg').readAsBytesSync();

        final image = JpegDecoder().decodeImage(origFileBytes)!;

        // The default quality is 100
        final jpg_100 = JpegEncoder().encodeImage(image);
        File('test/out/jpg/big_buck_bunny_100.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(jpg_100);
        print('JPG 100 ${jpg_100.length} / ${origFileBytes.length}');

        final jpg_75 = JpegEncoder(quality: 75).encodeImage(image);
        File('test/out/jpg/big_buck_bunny_75.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(jpg_75);
        print('JPG 75 ${jpg_75.length} / ${origFileBytes.length}');

        final jpg_50 = JpegEncoder(quality: 50).encodeImage(image);
        File('test/out/jpg/big_buck_bunny_50.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(jpg_50);
        print('JPG 50 ${jpg_50.length} / ${origFileBytes.length}');

        final jpg_25 = JpegEncoder(quality: 25).encodeImage(image);
        File('test/out/jpg/big_buck_bunny_25.jpg')
          ..createSync(recursive: true)
          ..writeAsBytesSync(jpg_25);
        print('JPG 25 ${jpg_25.length} / ${origFileBytes.length}');
      });
    }
  });
}
