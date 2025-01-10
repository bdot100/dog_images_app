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
        title: Text('Dog Image App'),
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
    return Column(
      children: [
        BreedDropdown(),
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
            final breed =
                'bulldog';
            context.read<DogBloc>().add(FetchRandomDogByBreed(breed: breed));
          },
          child: Text('Fetch Random Dog'),
        ),
      ],
    );
  }
}
