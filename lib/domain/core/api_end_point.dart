import 'package:netflix/core/srings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiPoint {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
