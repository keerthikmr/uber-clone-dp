// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_registration_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriverRegistrationState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  DriverDetails? get driverDetails => throw _privateConstructorUsedError;

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverRegistrationStateCopyWith<DriverRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverRegistrationStateCopyWith<$Res> {
  factory $DriverRegistrationStateCopyWith(DriverRegistrationState value,
          $Res Function(DriverRegistrationState) then) =
      _$DriverRegistrationStateCopyWithImpl<$Res, DriverRegistrationState>;
  @useResult
  $Res call({bool isLoading, String? error, DriverDetails? driverDetails});

  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class _$DriverRegistrationStateCopyWithImpl<$Res,
        $Val extends DriverRegistrationState>
    implements $DriverRegistrationStateCopyWith<$Res> {
  _$DriverRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? driverDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
    ) as $Val);
  }

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverDetailsCopyWith<$Res>? get driverDetails {
    if (_value.driverDetails == null) {
      return null;
    }

    return $DriverDetailsCopyWith<$Res>(_value.driverDetails!, (value) {
      return _then(_value.copyWith(driverDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverRegistrationStateImplCopyWith<$Res>
    implements $DriverRegistrationStateCopyWith<$Res> {
  factory _$$DriverRegistrationStateImplCopyWith(
          _$DriverRegistrationStateImpl value,
          $Res Function(_$DriverRegistrationStateImpl) then) =
      __$$DriverRegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, DriverDetails? driverDetails});

  @override
  $DriverDetailsCopyWith<$Res>? get driverDetails;
}

/// @nodoc
class __$$DriverRegistrationStateImplCopyWithImpl<$Res>
    extends _$DriverRegistrationStateCopyWithImpl<$Res,
        _$DriverRegistrationStateImpl>
    implements _$$DriverRegistrationStateImplCopyWith<$Res> {
  __$$DriverRegistrationStateImplCopyWithImpl(
      _$DriverRegistrationStateImpl _value,
      $Res Function(_$DriverRegistrationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? driverDetails = freezed,
  }) {
    return _then(_$DriverRegistrationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      driverDetails: freezed == driverDetails
          ? _value.driverDetails
          : driverDetails // ignore: cast_nullable_to_non_nullable
              as DriverDetails?,
    ));
  }
}

/// @nodoc

class _$DriverRegistrationStateImpl implements _DriverRegistrationState {
  const _$DriverRegistrationStateImpl(
      {this.isLoading = false, this.error, this.driverDetails});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final DriverDetails? driverDetails;

  @override
  String toString() {
    return 'DriverRegistrationState(isLoading: $isLoading, error: $error, driverDetails: $driverDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverRegistrationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.driverDetails, driverDetails) ||
                other.driverDetails == driverDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, driverDetails);

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverRegistrationStateImplCopyWith<_$DriverRegistrationStateImpl>
      get copyWith => __$$DriverRegistrationStateImplCopyWithImpl<
          _$DriverRegistrationStateImpl>(this, _$identity);
}

abstract class _DriverRegistrationState implements DriverRegistrationState {
  const factory _DriverRegistrationState(
      {final bool isLoading,
      final String? error,
      final DriverDetails? driverDetails}) = _$DriverRegistrationStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  DriverDetails? get driverDetails;

  /// Create a copy of DriverRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverRegistrationStateImplCopyWith<_$DriverRegistrationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
