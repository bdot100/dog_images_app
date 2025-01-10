import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dog_images_app/models/dog.dart';

class DogService {
  final String baseUrl = 'https://dog.ceo/api';

  Future<List<String>> fetchBreeds() async {
    final response = await http.get(Uri.parse('$baseUrl/breeds/list/all'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data['message'].keys);
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  Future<List<Dog>> fetchDogsByBreed(String breed) async {
    final response = await http.get(Uri.parse('$baseUrl/breed/$breed/images'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['message'] as List)
          .map((img) => Dog(imageUrl: img))
          .toList();
    } else {
      throw Exception('Failed to load dogs');
    }
  }

  Future<Dog> fetchRandomDogByBreed(String breed) async {
    final response =
        await http.get(Uri.parse('$baseUrl/breed/$breed/images/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Dog.fromJson(data);
    } else {
      throw Exception('Failed to load random dog');
    }
  }
}
