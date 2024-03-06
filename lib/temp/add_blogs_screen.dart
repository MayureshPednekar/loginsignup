import 'package:flutter/material.dart';
import 'package:loginsignup/temp/blogs_model.dart';

class AddBlogScreen extends StatefulWidget {
  final BlogsModel? model;

  const AddBlogScreen({super.key, this.model});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseValues();
  }

  void initialiseValues() {
    if (widget.model != null) {
      titleController.text = widget.model!.title!;
      descriptionController.text = widget.model!.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Blogs"),
      ),
      body: Column(
        children: [
          customTextField("Title", titleController),
          customTextField("Content", descriptionController),
          ElevatedButton(
            onPressed: () {
              // print(titleController.text);
              // print(descriptionController.text);

              if (widget.model == null) {
                final map = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "time": DateTime.now().millisecondsSinceEpoch,
                };

                final notesModel = BlogsModel.fromJson(map);

                Navigator.pop(context, notesModel);
              } else {
                final map = {
                  "title": titleController.text,
                  "description": descriptionController.text,
                  "time": widget.model!.time!,
                };

                final notesModel = BlogsModel.fromJson(map);

                Navigator.pop(context, notesModel);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget customTextField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        maxLines: 3,
        decoration: InputDecoration(
          labelText: title,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}