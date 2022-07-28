import 'package:primary_project/model/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
