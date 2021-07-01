// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _ThemeState call({bool isDarkTheme = true, bool usesDeviceTheme = false}) {
    return _ThemeState(
      isDarkTheme: isDarkTheme,
      usesDeviceTheme: usesDeviceTheme,
    );
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  bool get isDarkTheme => throw _privateConstructorUsedError;
  bool get usesDeviceTheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({bool isDarkTheme, bool usesDeviceTheme});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object? isDarkTheme = freezed,
    Object? usesDeviceTheme = freezed,
  }) {
    return _then(_value.copyWith(
      isDarkTheme: isDarkTheme == freezed
          ? _value.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      usesDeviceTheme: usesDeviceTheme == freezed
          ? _value.usesDeviceTheme
          : usesDeviceTheme // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) then) =
      __$ThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isDarkTheme, bool usesDeviceTheme});
}

/// @nodoc
class __$ThemeStateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(
      _ThemeState _value, $Res Function(_ThemeState) _then)
      : super(_value, (v) => _then(v as _ThemeState));

  @override
  _ThemeState get _value => super._value as _ThemeState;

  @override
  $Res call({
    Object? isDarkTheme = freezed,
    Object? usesDeviceTheme = freezed,
  }) {
    return _then(_ThemeState(
      isDarkTheme: isDarkTheme == freezed
          ? _value.isDarkTheme
          : isDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      usesDeviceTheme: usesDeviceTheme == freezed
          ? _value.usesDeviceTheme
          : usesDeviceTheme // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ThemeState extends _ThemeState with DiagnosticableTreeMixin {
  const _$_ThemeState({this.isDarkTheme = true, this.usesDeviceTheme = false})
      : super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isDarkTheme;
  @JsonKey(defaultValue: false)
  @override
  final bool usesDeviceTheme;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState(isDarkTheme: $isDarkTheme, usesDeviceTheme: $usesDeviceTheme)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState'))
      ..add(DiagnosticsProperty('isDarkTheme', isDarkTheme))
      ..add(DiagnosticsProperty('usesDeviceTheme', usesDeviceTheme));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeState &&
            (identical(other.isDarkTheme, isDarkTheme) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkTheme, isDarkTheme)) &&
            (identical(other.usesDeviceTheme, usesDeviceTheme) ||
                const DeepCollectionEquality()
                    .equals(other.usesDeviceTheme, usesDeviceTheme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isDarkTheme) ^
      const DeepCollectionEquality().hash(usesDeviceTheme);

  @JsonKey(ignore: true)
  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);
}

abstract class _ThemeState extends ThemeState {
  const factory _ThemeState({bool isDarkTheme, bool usesDeviceTheme}) =
      _$_ThemeState;
  const _ThemeState._() : super._();

  @override
  bool get isDarkTheme => throw _privateConstructorUsedError;
  @override
  bool get usesDeviceTheme => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
