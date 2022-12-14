import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:invan_aplication/screens/home_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox('user_data');
  runApp(const MyApp());
}
