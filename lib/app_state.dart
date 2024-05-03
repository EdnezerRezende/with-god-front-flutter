import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _UserAccessToken =
          prefs.getString('ff_UserAccessToken') ?? _UserAccessToken;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _UserAccessToken = '';
  String get UserAccessToken => _UserAccessToken;
  set UserAccessToken(String value) {
    _UserAccessToken = value;
    prefs.setString('ff_UserAccessToken', value);
  }

  String _token = 'nulo';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  List<BooksStruct> _books = [];
  List<BooksStruct> get books => _books;
  set books(List<BooksStruct> value) {
    _books = value;
  }

  void addToBooks(BooksStruct value) {
    _books.add(value);
  }

  void removeFromBooks(BooksStruct value) {
    _books.remove(value);
  }

  void removeAtIndexFromBooks(int index) {
    _books.removeAt(index);
  }

  void updateBooksAtIndex(
    int index,
    BooksStruct Function(BooksStruct) updateFn,
  ) {
    _books[index] = updateFn(_books[index]);
  }

  void insertAtIndexInBooks(int index, BooksStruct value) {
    _books.insert(index, value);
  }

  bool _quizConcluido = false;
  bool get quizConcluido => _quizConcluido;
  set quizConcluido(bool value) {
    _quizConcluido = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
