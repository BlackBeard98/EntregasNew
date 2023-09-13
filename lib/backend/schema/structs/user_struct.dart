// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? id,
    String? name,
    String? mail,
    String? firstLastName,
    String? secondLastName,
    bool? isLogued,
    String? accessToken,
  })  : _id = id,
        _name = name,
        _mail = mail,
        _firstLastName = firstLastName,
        _secondLastName = secondLastName,
        _isLogued = isLogued,
        _accessToken = accessToken;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "mail" field.
  String? _mail;
  String get mail => _mail ?? '';
  set mail(String? val) => _mail = val;
  bool hasMail() => _mail != null;

  // "firstLastName" field.
  String? _firstLastName;
  String get firstLastName => _firstLastName ?? '';
  set firstLastName(String? val) => _firstLastName = val;
  bool hasFirstLastName() => _firstLastName != null;

  // "secondLastName" field.
  String? _secondLastName;
  String get secondLastName => _secondLastName ?? '';
  set secondLastName(String? val) => _secondLastName = val;
  bool hasSecondLastName() => _secondLastName != null;

  // "isLogued" field.
  bool? _isLogued;
  bool get isLogued => _isLogued ?? false;
  set isLogued(bool? val) => _isLogued = val;
  bool hasIsLogued() => _isLogued != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;
  bool hasAccessToken() => _accessToken != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        mail: data['mail'] as String?,
        firstLastName: data['firstLastName'] as String?,
        secondLastName: data['secondLastName'] as String?,
        isLogued: data['isLogued'] as bool?,
        accessToken: data['accessToken'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'mail': _mail,
        'firstLastName': _firstLastName,
        'secondLastName': _secondLastName,
        'isLogued': _isLogued,
        'accessToken': _accessToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'mail': serializeParam(
          _mail,
          ParamType.String,
        ),
        'firstLastName': serializeParam(
          _firstLastName,
          ParamType.String,
        ),
        'secondLastName': serializeParam(
          _secondLastName,
          ParamType.String,
        ),
        'isLogued': serializeParam(
          _isLogued,
          ParamType.bool,
        ),
        'accessToken': serializeParam(
          _accessToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        mail: deserializeParam(
          data['mail'],
          ParamType.String,
          false,
        ),
        firstLastName: deserializeParam(
          data['firstLastName'],
          ParamType.String,
          false,
        ),
        secondLastName: deserializeParam(
          data['secondLastName'],
          ParamType.String,
          false,
        ),
        isLogued: deserializeParam(
          data['isLogued'],
          ParamType.bool,
          false,
        ),
        accessToken: deserializeParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        name == other.name &&
        mail == other.mail &&
        firstLastName == other.firstLastName &&
        secondLastName == other.secondLastName &&
        isLogued == other.isLogued &&
        accessToken == other.accessToken;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, name, mail, firstLastName, secondLastName, isLogued, accessToken]);
}

UserStruct createUserStruct({
  String? id,
  String? name,
  String? mail,
  String? firstLastName,
  String? secondLastName,
  bool? isLogued,
  String? accessToken,
}) =>
    UserStruct(
      id: id,
      name: name,
      mail: mail,
      firstLastName: firstLastName,
      secondLastName: secondLastName,
      isLogued: isLogued,
      accessToken: accessToken,
    );
