import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _UserAccessToken = await secureStorage.getString('ff_UserAccessToken') ??
          _UserAccessToken;
    });
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _UserAccessToken = '';
  String get UserAccessToken => _UserAccessToken;
  set UserAccessToken(String value) {
    _UserAccessToken = value;
    secureStorage.setString('ff_UserAccessToken', value);
  }

  void deleteUserAccessToken() {
    secureStorage.delete(key: 'ff_UserAccessToken');
  }

  String _token = 'nulo';
  String get token => _token;
  set token(String value) {
    _token = value;
    secureStorage.setString('ff_token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
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

  String _versionBible = 'nvi';
  String get versionBible => _versionBible;
  set versionBible(String value) {
    _versionBible = value;
  }

  String _TokenBibleAPI = '-';
  String get TokenBibleAPI => _TokenBibleAPI;
  set TokenBibleAPI(String value) {
    _TokenBibleAPI = value;
  }

  bool _permissionBiometria = false;
  bool get permissionBiometria => _permissionBiometria;
  set permissionBiometria(bool value) {
    _permissionBiometria = value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
