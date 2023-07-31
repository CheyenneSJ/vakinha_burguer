import 'storage.dart';
import 'dart:html';


class SessionStorage implements Storage{
  @override
  void clean() {
    
  }

  @override
  String getData(String key) => window.sessionStorage[key] ?? '';
    
 @override
  void setData(String key, String value) {
  }


  }

  

