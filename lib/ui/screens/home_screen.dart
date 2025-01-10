import 'package:dog_images_app/ui/widgets/breed_dropdown.dart';
import 'package:dog_images_app/ui/widgets/dog_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_images_app/blocs/dog_bloc.dart';
import 'package:dog_images_app/blocs/dog_event.dart';
import 'package:dog_images_app/blocs/dog_state.dart';
import 'package:dog_images_app/repositories/dog_repository.dart';
import 'package:dog_images_app/services/dog_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.lightBlueAccent, // Lighter blue background color
        title: Text(
          'Dog Image App',
          style: TextStyle(
            fontSize: 22, // Larger font size
            fontWeight: FontWeight.bold, // Bold text
            color: Colors.white, // White text color
            fontFamily:
                'Roboto', // Custom font family (if added to your project)
          ),
        ),
        centerTitle: true, // Centers the title
        elevation: 2, // Adds a subtle shadow for depth
      ),
      body: BlocProvider(
        create: (context) => DogBloc(DogRepository(DogService())),
        child: DogView(),
      ),
    );
  }
}

class DogView extends StatelessWidget {
  const DogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          BreedDropdown(),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<DogBloc, DogState>(
            builder: (context, state) {
              if (state is DogLoading) {
                return CircularProgressIndicator();
              } else if (state is DogLoaded) {
                if (state.dogs.isNotEmpty) {
                  return DogImageWidget(imageUrl: state.dogs.first.imageUrl);
                } else {
                  return Text('No dogs found for this breed.');
                }
              } else if (state is DogError) {
                return Text('Error: ${state.message}');
              }
              return Container();
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              final breed = 'bulldog';
              context.read<DogBloc>().add(FetchRandomDogByBreed(breed: breed));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlue, // Text color
              padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: Text(
              'Fetch Random Dog',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
