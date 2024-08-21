import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/api.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading(true);
    final url = Uri.parse('${BaseUrl.api}/login');
    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['acces_token'];

      box.write('acces_token', token);
      Get.offAllNamed('/bottom_menu');
    } else {
      Get.snackbar('Error', 'Login Failed. please check your credenial',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
