import 'dart:io';

import 'package:favourite_places/model/place_model.dart';
import 'package:favourite_places/providers/place_controller.dart';
import 'package:favourite_places/widgets.dart/image_input.dart';
import 'package:favourite_places/widgets.dart/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final enteredText = _titleController.text;

    if (enteredText.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(placesProvider.notifier).addPlace(Place(
        id: const Uuid().v4(), name: enteredText, image: _selectedImage!));

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
              const SizedBox(
                height: 16,
              ),
              ImageInput(
                onSelectImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LocationInput(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                label: const Text('Add Place'),
                icon: const Icon(Icons.add),
              )
            ],
          )),
    );
  }
}
