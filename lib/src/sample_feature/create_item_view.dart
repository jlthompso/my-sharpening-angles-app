import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// Displays detailed information about a SampleItem.
class CreateItemView extends StatefulWidget {
  const CreateItemView({super.key});

  static const routeName = '/new';

  @override
  State<CreateItemView> createState() => _CreateItemViewState();
}

class _CreateItemViewState extends State<CreateItemView> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  XFile? _photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox.square(
                dimension: MediaQuery.of(context).size.width * 0.75,
                child: _photo != null
                    ? Image.file(File(_photo!.path))
                    : IconButton(
                        onPressed: () async {
                          final XFile? img = await _picker.pickImage(
                              source: ImageSource.camera);
                          if (img != null) {
                            setState(() {
                              _photo = img;
                            });
                          }
                        },
                        icon: const Icon(Icons.add_a_photo_outlined),
                      )),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Tool Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
