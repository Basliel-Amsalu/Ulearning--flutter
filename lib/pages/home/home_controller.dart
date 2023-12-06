import 'package:flutter/material.dart';
import 'package:ulearning/common/entities/user.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/global.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() {
    print("Home Controller Init");
  }
}
