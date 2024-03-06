import 'package:loginsignup/temp/add_blogs_screen.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/temp/database.dart';
import 'package:loginsignup/temp/blogs_model.dart';

class BlogsAppScreen extends StatefulWidget {
  const BlogsAppScreen({super.key});

  @override
  State<BlogsAppScreen> createState() => _BlogsAppScreenState();
}


class _BlogsAppScreenState extends State<BlogsAppScreen> {
  List<BlogsModel> blogsItems = [];

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    blogsItems = await SqfliteDatabase.getDataFromDatabase();

    print(blogsItems.length);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 211, 230),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 207, 237),
        title: const Text("ProBlog"),
      ),
      body: ListView.builder(
          itemCount: blogsItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(blogsItems[index].title!),
              subtitle: Text(blogsItems[index].description!),
              leading: IconButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddBlogScreen(
                        model: blogsItems[index],
                      ),
                    ),
                  );

                  await SqfliteDatabase.updateDataInDatabase(
                    result,
                    result.time,
                  );

                  blogsItems[index] = result;

                  setState(() {});
                },
                icon: const Icon(Icons.edit),
              ),
              trailing: IconButton(
                onPressed: () async {
                  await SqfliteDatabase.deleteDataFromDatabase(
                      blogsItems[index].time!);

                  blogsItems.removeAt(index);
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBlogScreen(),
            ),
          );

          print(result);

          if (result != null) {
            blogsItems.add(result);

            await SqfliteDatabase.insertData(result);

            setState(() {});
          }
        },
      ),
    );
  }
}