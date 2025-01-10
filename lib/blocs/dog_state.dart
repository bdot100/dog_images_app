import 'package:equatable/equatable.dart';
import 'package:dog_images_app/models/dog.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object?> get props => [];
}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<String> breeds;
  final List<Dog> dogs;

  const DogLoaded(this.breeds, this.dogs);

  @override
  List<Object?> get props => [breeds, dogs];
}

class DogError extends DogState {
  final String message;

  const DogError(this.message);

  @override
  List<Object?> get props => [message];
}
