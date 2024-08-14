import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_application/core/api/networkManager.dart';
import 'package:web_application/core/api/urls.dart';
import 'package:web_application/core/services/dialogs/adaptive_ok_dialog.dart';
import 'package:web_application/models/employee_category_model.dart';

class EmployeeCategoryController extends GetxController {
  final categoryNameController = TextEditingController();
  final remarksController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void onInit() {
    fetchEmpCategory();
    super.onInit();
  }

  var empcategories = <EmployeeCategory>[].obs;
  addEmpCategory() async {
    final result = await NetWorkManager.shared().request(
        url: ApiUrls.BASE_URL + ApiUrls.ADD_EMPLOYEE_CATEGORY,
        method: 'post',
        isAuthRequired: false,
        data: {
          "name": categoryNameController.text,
          "remarks": remarksController.text,
          "status": statusController.text,
          "isactive": true
        });

    if (result.isLeft) {
      awesomeOkDialog(message: result.left.message);
    } else {
      final message = result.right['message'];
      await fetchEmpCategory();
    }
  }

  fetchEmpCategory() async {
    try {
      // Making the GET request to the API
      var response = await http
          .get(Uri.parse(ApiUrls.BASE_URL + ApiUrls.GET_ALL_EMPLOYEE_CATEGORY));
      if (response.statusCode == 200) {
        // Decoding the JSON response body into a List
        var jsonData = json.decode(response.body) as List;
        // Mapping the List to a List of Department objects
        empcategories.value =
            jsonData.map((json) => EmployeeCategory.fromJson(json)).toList();
      }
    } catch (e) {
      print("Error");
    }
  }

  updateEmpCategory(EmployeeCategory empcategory) async {
    final result = await NetWorkManager.shared().request(
        isAuthRequired: false,
        method: 'put',
        url: ApiUrls.BASE_URL + ApiUrls.UPDATE_EMPLOYEE_CATEGORY,
        params: {"employee_category_id": empcategory.id},
        data: {"name": empcategory.name, "is_active": true});

    if (result.isLeft) {
      awesomeOkDialog(message: result.left.message);
    } else {
      awesomeOkDialog(message: result.right['message']);
    }
  }
}
