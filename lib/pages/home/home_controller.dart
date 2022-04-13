import 'package:flutter_getx/model/model.dart';
import 'package:flutter_getx/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  MovieRepository movieRepository = Get.put(MovieRepository());
  int page = 1;
  RxList list_movie = <Movie>[].obs;
  RxBool isNoLoadMore = false.obs;
  RxBool isLoading = true.obs;

  void callAPI() {
    isLoading.value = true;
    movieRepository.getMovie(page).then((List<Movie> value) {
      isLoading.value = false;
      if (value.isEmpty) {
        isNoLoadMore.value = true;
      }
      list_movie.addAll(value);
    }).catchError((err, track) {
      print("Something wrong ${err} ${track}");
    });
  }

  String name = "";
  String email = "";
  List<dynamic> saved_person = [];
  void getFromGetStorage() {
    Map<String, dynamic> getStorageValue = GetStorage().read("auth");
    if (GetStorage().hasData("list_person")) {
      saved_person = GetStorage().read("list_person");
    }
    name = getStorageValue["name"];
    email = getStorageValue["email"];
  }

  void listenSession() {
    GetStorage().listenKey("list_person", (value) {
      print("Terjadi perubahan pada session list_person $value");
    });
  }

  void logout() {
    GetStorage().remove("auth").then((value) {});

    GetStorage().erase().then((value) {
      Get.toNamed("/splash");
    });
  }

  @override
  void onInit() {
    listenSession();
    getFromGetStorage();
    // TODO: implement onInit
    super.onInit();
  }

  void onReady() {
    callAPI();
    super.onReady();
  }
}

class Put {}
