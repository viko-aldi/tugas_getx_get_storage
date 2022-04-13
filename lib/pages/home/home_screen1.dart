import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/home/home_controller.dart';
import 'package:flutter_getx/widget/loading_view.dart';
import 'package:flutter_getx/widget/loading_view.dart';
import 'package:flutter_getx/widget/movie_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  late HomeController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Movie 2022"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Obx(
            () => controller.list_movie.isEmpty
                ? LoadingView()
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollNotification) {
                      if (scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent) {
                        if (controller.isNoLoadMore.value == false) {
                          if (controller.isLoading.value == false) {
                            controller.page = controller.page + 1;
                            controller.callAPI();
                          }
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                        itemCount: controller.isNoLoadMore.value == true
                            ? controller.list_movie.value.length
                            : controller.list_movie.value.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < controller.list_movie.value.length) {
                            return MovieView(
                                movie: controller.list_movie.value[index]);
                          } else {
                            return LoadingView();
                          }
                        }),
                  ),
          )),
    );
  }
}
