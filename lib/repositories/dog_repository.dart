import 'package:dog_images_app/models/dog.dart';
import 'package:dog_images_app/services/dog_service.dart';


class DogRepository {
  final DogService dogService;

  DogRepository(this.dogService);

  Future<Dog> getRandomDogByBreed(String breed) {
    return dogService.fetchRandomDogByBreed(breed);
  }

  Future<List<Dog>> getDogByBreed(String breed) {
    return dogService.fetchDogsByBreed(breed);
  }

  Future<List<String>> getBreed(String breed) {
    return dogService.fetchBreeds(breed);
  }

}
