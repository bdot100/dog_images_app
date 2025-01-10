import 'package:equatable/equatable.dart';

abstract class DogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBreeds extends DogEvent {}

class FetchDogsByBreed extends DogEvent {
  final String breed;

  FetchDogsByBreed({required this.breed});

  @override
  List<Object?> get props => [breed];
}

class FetchRandomDogByBreed extends DogEvent {
  final String breed;

  FetchRandomDogByBreed({required this.breed});

  @override
  List<Object?> get props => [breed];
}
