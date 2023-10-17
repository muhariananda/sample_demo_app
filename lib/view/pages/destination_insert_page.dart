import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_destination_app/controller/destination_controller.dart';
import 'package:sample_destination_app/models/destination.dart';

class DestinationInsertPage extends StatefulWidget {
  const DestinationInsertPage({super.key});

  static const routeName = '/destination-insert';

  @override
  State<DestinationInsertPage> createState() => _DestinationInsertPageState();
}

class _DestinationInsertPageState extends State<DestinationInsertPage> {
  final _controller = Get.put(DestinationController());

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  double _rate = 5;
  String _imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save_rounded),
            onPressed: _onSaveDestination,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_photo_alternate_rounded),
                  label: const Text('Add Image'),
                  onPressed: _onImagePicked,
                ),
              ),
              Text(_imagePath),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Add name...',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Add description...',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  _rate.toString(),
                ),
              ),
              Slider(
                max: 5,
                divisions: 5,
                value: _rate,
                onChanged: _onChangeRate,
                label: _rate.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeRate(double value) {
    setState(() {
      _rate = value;
    });
  }

  void _onSaveDestination() {
    final destination = Destination(
      name: _nameController.text,
      description: _descriptionController.text,
      price: int.parse(_priceController.text),
      rating: _rate,
      imagePath: _imagePath,
    );

    _controller.addDestination(destination);

    const snackBar = SnackBar(
      content: Text('Destination is added'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pop(context);
  }

  Future<void> _onImagePicked() async {
    late XFile? imageFile;
    final imagePicker = ImagePicker();

    // get from gallery
    imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

    // get from camera
    // imageFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      setState(() {
        _imagePath = imageFile!.path;
      });
    }
  }
}
