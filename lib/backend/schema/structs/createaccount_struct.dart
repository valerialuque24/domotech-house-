// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateaccountStruct extends BaseStruct {
  CreateaccountStruct({
    String? username,
    String? email,
    String? password,
  })  : _username = username,
        _email = email,
        _password = password;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  static CreateaccountStruct fromMap(Map<String, dynamic> data) =>
      CreateaccountStruct(
        username: data['username'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
      );

  static CreateaccountStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateaccountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'email': _email,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateaccountStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateaccountStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateaccountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateaccountStruct &&
        username == other.username &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([username, email, password]);
}

CreateaccountStruct createCreateaccountStruct({
  String? username,
  String? email,
  String? password,
}) =>
    CreateaccountStruct(
      username: username,
      email: email,
      password: password,
    );
