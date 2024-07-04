import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://newsapi.org/v2';
  final String _apiKey = 'f4c2f38dbe354231a18deb604b93f0c9';
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String category}) async {
    var response = await _dio.get(
        '$_baseUrl/top-headlines?category=$category&apiKey=$_apiKey&country=eg');
    return response.data;
  }

  Future<Map<String, dynamic>> getEverything({required String search}) async {
    var response = await _dio.get(
        '$_baseUrl/everything?q=$search&sortBy=publishedAt&apiKey=$_apiKey');
    return response.data;
  }
}
//everything?q=tesla&from=2024-06-03&sortBy=publishedAt&apiKey=f4c2f38dbe354231a18deb604b93f0c9
