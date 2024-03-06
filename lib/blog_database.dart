import 'package:loginsignup/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String BLOG_COLLECTON_REF = "blogs";

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _blogsRef;

  DatabaseService() {
    _blogsRef = _firestore.collection(BLOG_COLLECTON_REF).withConverter<Blog>(
        fromFirestore: (snapshots, _) => Blog.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (blog, _) => blog.toJson());
  }

  Stream<QuerySnapshot> getBlogs() {
    return _blogsRef.snapshots();
  }

  void addTodo(Blog blog) async {
    _blogsRef.add(blog);
  }

  void updateTodo(String blogId, Blog blog) {
    _blogsRef.doc(blogId).update(blog.toJson());
  }

  void deleteTodo(String blogId) {
    _blogsRef.doc(blogId).delete();
  }

  void addBlog(Blog newBlog) {}
}