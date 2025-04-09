import 'dart:convert';
import 'package:bloc/src/bloc.dart';
import 'package:flutter_application_1/post/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/get_post.dart';

class PostRepository {
  Future<List<Posts>> getPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((post) => Posts.fromJson(post)).toList();
    } else {
      throw Exception('Ошибка загрузки постов');
    }
  }
}
