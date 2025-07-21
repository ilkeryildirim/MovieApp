import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'logger.dart';

class ImageCompressHelper {
  static const int _targetWidth = 800;
  static const int _targetHeight = 800;
  static const int _quality = 70;
  static const int _maxFileSize = 1024 * 1024; // 1MB

  static Future<File?> compressImage(File file) async {
    try {
      AppLogger.info('Compressing image: ${file.path}');
      
      // Get file size
      final fileSize = await file.length();
      AppLogger.info('Original file size: ${(fileSize / 1024 / 1024).toStringAsFixed(2)}MB');
      
      // If already small enough, return original
      if (fileSize <= _maxFileSize) {
        AppLogger.info('File already small enough, no compression needed');
        return file;
      }

      // Get temp directory
      final tempDir = await getTemporaryDirectory();
      final fileName = path.basenameWithoutExtension(file.path);
      final extension = path.extension(file.path);
      final targetPath = path.join(tempDir.path, '${fileName}_compressed$extension');

      // Compress image
      final Uint8List? compressedData = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        minWidth: _targetWidth,
        minHeight: _targetHeight,
        quality: _quality,
        format: extension.toLowerCase() == '.png' ? CompressFormat.png : CompressFormat.jpeg,
      );

      if (compressedData == null) {
        AppLogger.error('Failed to compress image', error: 'Compression returned null');
        return file; // Return original if compression fails
      }

      // Write compressed data to file
      final compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedData);

      final compressedSize = await compressedFile.length();
      AppLogger.info('Compressed file size: ${(compressedSize / 1024 / 1024).toStringAsFixed(2)}MB');
      AppLogger.info('Compression ratio: ${((fileSize - compressedSize) / fileSize * 100).toStringAsFixed(1)}%');

      return compressedFile;
    } catch (e) {
      AppLogger.error('Error compressing image', error: e);
      return file; // Return original file if compression fails
    }
  }

  static Future<bool> isImageFile(String filePath) async {
    final extension = path.extension(filePath).toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.webp'].contains(extension);
  }

  static String getFileSizeString(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
} 