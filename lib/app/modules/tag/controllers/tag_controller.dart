import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/tag_model.dart';
import '../../../utils/api.dart';

class TagController extends GetxController {
  var tagList = <DataTag>[].obs;
  var isLoading = false.obs;

  final String baseUrl = '${BaseUrl.api}/tag';

  @override
  void onInit() {
    super.onInit();
    fetchTages();
  }

  void fetchTages() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var tag = Tag.fromJson(jsonResponse);
      tagList.value = tag.data!;
      } else {
        Get.snackbar("error", "Failed to fetch tages");
      }
    } catch (e) {
      Get.snackbar("error", "Failed to fetch tages: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTag(DataTag newTag) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newTag.toJson()),
      );
      if (response.statusCode == 201) {
        fetchTages();
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

  Future<void> updateTag(int id, DataTag updateTag) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updateTag.toJson()),
      );
      if (response.statusCode == 200) {
        fetchTages();
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

  Future<void> deleteTag(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchTages();
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
