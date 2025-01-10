import 'package:dog_images_app/blocs/dog_bloc.dart';
import 'package:dog_images_app/blocs/dog_event.dart';
import 'package:dog_images_app/blocs/dog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedDropdown extends StatelessWidget {
  const BreedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogBloc, DogState>(
      builder: (context, state) {
        if (state is DogInitial) {
          // Dispatch the FetchBreeds event when the widget is in the initial state
          context.read<DogBloc>().add(FetchBreeds());
          return Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        } else if (state is DogLoading) {
          // Show a circular loader while data is being fetched
          return Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        } else if (state is BreedsLoaded) {
          // Display the dropdown when breeds are successfully loaded
          return DropdownButton<String>(
            hint: Text(
              'Select Breed',
              style: TextStyle(
                fontSize: 16,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            onChanged: (String? newValue) {
              // Dispatch FetchDogsByBreed event when a breed is selected
              if (newValue != null) {
                context.read<DogBloc>().add(FetchDogsByBreed(newValue, breed: newValue));
              }
            },
            items: state.breeds.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.lightBlueAccent,
            ),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            underline: Container(
              height: 2,
              color: Colors.lightBlueAccent,
            ),
          );
        } else if (state is DogError) {
          // Show an error message if fetching breeds fails
          return Center(
            child: Text(
              'Failed to load breeds: ${state.message}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return Container(); // Default empty container for unsupported states
      },
    );
  }
}
