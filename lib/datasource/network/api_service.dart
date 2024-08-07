import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  // Base URL của API
  static const String baseUrl = 'https://api.example.com';

  // Phương thức GET
  Future<Response> get(String endpoint) async {
    try {
      Response response = await _dio.get('$baseUrl/$endpoint');
      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  // Phương thức POST
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post('$baseUrl/$endpoint', data: data);
      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  // Các phương thức khác như PUT, DELETE có thể được triển khai tương tự

  // Xử lý các lỗi hay thêm các phương thức mở rộng khác nếu cần

  // Ví dụ: Phương thức để lấy danh sách phim
  Future<Response> getMovies() async {
    try {
      return await get('movies');
    } catch (e) {
      rethrow;
    }
  }
}
