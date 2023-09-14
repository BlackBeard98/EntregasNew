// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameIDStruct extends BaseStruct {
  NameIDStruct({
    String? name,
    String? id,
    bool? isSet,
  })  : _name = name,
        _id = id,
        _isSet = isSet;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "isSet" field.
  bool? _isSet;
  bool get isSet => _isSet ?? false;
  set isSet(bool? val) => _isSet = val;
  bool hasIsSet() => _isSet != null;

  static NameIDStruct fromMap(Map<String, dynamic> data) => NameIDStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        isSet: data['isSet'] as bool?,
      );

  static NameIDStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NameIDStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'isSet': _isSet,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isSet': serializeParam(
          _isSet,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NameIDStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameIDStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isSet: deserializeParam(
          data['isSet'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NameIDStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NameIDStruct &&
        name == other.name &&
        id == other.id &&
        isSet == other.isSet;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id, isSet]);
}

NameIDStruct createNameIDStruct({
  String? name,
  String? id,
  bool? isSet,
}) =>
    NameIDStruct(
      name: name,
      id: id,
      isSet: isSet,
    );
