import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 50;
  int get count => _count;

   setCount() {
    _count++;
    notifyListeners();
  }
}
