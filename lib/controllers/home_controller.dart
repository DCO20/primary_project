import 'package:flutter/cupertino.dart';
import 'package:primary_project/model/post_model.dart';
import 'package:primary_project/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepository.getList();
  }
}
