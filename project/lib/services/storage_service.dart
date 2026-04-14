import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StorageService {
  final Dio _dio = Dio();
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  Future<String?> uploadImage(String uid, File file) async {
    try {
      final cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'];
      final uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET'];
      final url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
        'upload_preset': uploadPreset,
      });

      final response = await _dio.post<Map<String, dynamic>>(url, data: formData);

      if (response.statusCode == 200 && response.data != null) {
        final secureUrl = response.data!['secure_url'] as String;
        await _db.ref('users/$uid/profile_url').set(secureUrl);
        return secureUrl;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
