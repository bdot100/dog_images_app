import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_images_app/blocs/dog_event.dart';
import 'package:dog_images_app/blocs/dog_state.dart';
import 'package:dog_images_app/repositories/dog_repository.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository dogRepository;

  DogBloc(this.dogRepository) : super(DogInitial()) {
    // Registering the event handler
    on<FetchRandomDogByBreed>(_onFetchRandomDogByBreed);
    on<FetchBreeds>(_onFetchAllBreeds);
    on<FetchDogsByBreed>(_onFetchDogsByBreed);
  }

  Future<void> _onFetchRandomDogByBreed(
      FetchRandomDogByBreed event, Emitter<DogState> emit) async {
    emit(DogLoading());
    try {
      final dog = await dogRepository.getRandomDogByBreed(event.breed);
      final breeds = await dogRepository.getBreed();
      emit(DogLoaded(breeds, [dog]));
    } catch (e) {
      emit(DogError(e.toString()));
      //print(e.toString());
    }
  }

  Future<void> _onFetchDogsByBreed(
      FetchDogsByBreed event, Emitter<DogState> emit) async {
    emit(DogLoading());
    try {
      final dog = await dogRepository.getDogByBreed(event.breed);
      final breeds = await dogRepository.getBreed();
      emit(DogLoaded(breeds, dog));
    } catch (e) {
      emit(DogError(e.toString()));
      //print(e.toString());
    }
  }

    Future<void> _onFetchAllBreeds(
      FetchBreeds event, Emitter<DogState> emit) async {
    emit(DogLoading());
    try {
      final breeds = await dogRepository.getBreed();
      emit(BreedsLoaded(breeds)); // New state for loaded breeds
    } catch (e) {
      emit(DogError(e.toString()));
    }
  }


}
