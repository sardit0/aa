import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/user_model.dart';
import '../../../utils/api.dart';

class UserController extends GetxController {
  var userList = <DataUser>[].obs;
  var isLoading = false.obs;

  final String baseUrl = '${BaseUrl.api}/user';

  @override
  void onInit() {
    super.onInit();
    fetchUseres();
  }

  void fetchUseres() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var user = User.fromJson(jsonResponse);
      userList.value = user.data!;
      } else {
        Get.snackbar("error", "Failed to fetch tages");
      }
    } catch (e) {
      Get.snackbar("error", "Failed to fetch tages: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addUser(DataUser newUser) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newUser.toJson()),
      );
      if (response.statusCode == 201) {
        fetchUseres();
        Get.back();
        Get.snackbar("Success", "Tag added successfully");
      } else {
        Get.snackbar("Error", "Failed to add tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add tag: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateUser(int id, DataUser updateUser) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updateUser.toJson()),
      );
      if (response.statusCode == 200) {
        fetchUseres();
        Get.back();
        Get.snackbar("Success", "Tag updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update tag: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchUseres();
        Get.snackbar("Success", "Tag deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete tag: $e");
    } finally {
      isLoading(false);
    }
  }
}
