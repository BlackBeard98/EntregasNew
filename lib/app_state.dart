import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_authUser') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_authUser') ?? '{}';
          _authUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _authUser =
      UserStruct.fromSerializableMap(jsonDecode('{\"isLogued\":\"false\"}'));
  UserStruct get authUser => _authUser;
  set authUser(UserStruct _value) {
    _authUser = _value;
    secureStorage.setString('ff_authUser', _value.serialize());
  }

  void deleteAuthUser() {
    secureStorage.delete(key: 'ff_authUser');
  }

  void updateAuthUserStruct(Function(UserStruct) updateFn) {
    updateFn(_authUser);
    secureStorage.setString('ff_authUser', _authUser.serialize());
  }

  List<String> _pageCategories = [];
  List<String> get pageCategories => _pageCategories;
  set pageCategories(List<String> _value) {
    _pageCategories = _value;
  }

  void addToPageCategories(String _value) {
    _pageCategories.add(_value);
  }

  void removeFromPageCategories(String _value) {
    _pageCategories.remove(_value);
  }

  void removeAtIndexFromPageCategories(int _index) {
    _pageCategories.removeAt(_index);
  }

  void updatePageCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _pageCategories[_index] = updateFn(_pageCategories[_index]);
  }

  void insertAtIndexInPageCategories(int _index, String _value) {
    _pageCategories.insert(_index, _value);
  }

  String _contains = '';
  String get contains => _contains;
  set contains(String _value) {
    _contains = _value;
  }

  NameIDStruct _Provincia =
      NameIDStruct.fromSerializableMap(jsonDecode('{\"isSet\":\"false\"}'));
  NameIDStruct get Provincia => _Provincia;
  set Provincia(NameIDStruct _value) {
    _Provincia = _value;
  }

  void updateProvinciaStruct(Function(NameIDStruct) updateFn) {
    updateFn(_Provincia);
  }

  NameIDStruct _Municipality =
      NameIDStruct.fromSerializableMap(jsonDecode('{\"isSet\":\"false\"}'));
  NameIDStruct get Municipality => _Municipality;
  set Municipality(NameIDStruct _value) {
    _Municipality = _value;
  }

  void updateMunicipalityStruct(Function(NameIDStruct) updateFn) {
    updateFn(_Municipality);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
