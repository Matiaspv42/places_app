import 'package:flutter/material.dart';
import 'package:flutter_favorite_places_app/providers/user_provider.dart';
import 'package:flutter_favorite_places_app/widgets/image_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScree extends ConsumerStatefulWidget {
  const AddPlaceScree({super.key});

  @override
  ConsumerState<AddPlaceScree> createState() => _AddPlaceScreeState();
}

class _AddPlaceScreeState extends ConsumerState<AddPlaceScree> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);

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
      appBar: AppBar(title: const Text('Add new place')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text('Add Place'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
