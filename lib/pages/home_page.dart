import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:primary_project/controllers/home_controller.dart';
import 'package:primary_project/model/post_model.dart';
import 'package:primary_project/repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ValueListenableBuilder<List<PostModel>>(
                  valueListenable: _controller.posts,
                  builder: (_, list, __) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (_, idx) => ListTile(
                        title: Text(list[idx].title),
                      ),
                      separatorBuilder: (_, __) => Divider(),
                    );
                  }),
            ],
          ),
        ));
  }
}
