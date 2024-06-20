// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadImageState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadImageStateCopyWith<T, $Res> {
  factory $UploadImageStateCopyWith(
          UploadImageState<T> value, $Res Function(UploadImageState<T>) then) =
      _$UploadImageStateCopyWithImpl<T, $Res, UploadImageState<T>>;
}

/// @nodoc
class _$UploadImageStateCopyWithImpl<T, $Res, $Val extends UploadImageState<T>>
    implements $UploadImageStateCopyWith<T, $Res> {
  _$UploadImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$UploadImageStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UploadImageState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements UploadImageState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$UploadImageStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UploadImageState<$T>.ladding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) {
    return ladding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) {
    return ladding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ladding != null) {
      return ladding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) {
    return ladding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) {
    return ladding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (ladding != null) {
      return ladding(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements UploadImageState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$UploadImageStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'UploadImageState<$T>.sucess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) {
    return sucess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) {
    return sucess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) {
    return sucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) {
    return sucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements UploadImageState<T> {
  const factory Success() = _$SuccessImpl<T>;
}

/// @nodoc
abstract class _$$RemoveImageImplCopyWith<T, $Res> {
  factory _$$RemoveImageImplCopyWith(_$RemoveImageImpl<T> value,
          $Res Function(_$RemoveImageImpl<T>) then) =
      __$$RemoveImageImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String imageUrl});
}

/// @nodoc
class __$$RemoveImageImplCopyWithImpl<T, $Res>
    extends _$UploadImageStateCopyWithImpl<T, $Res, _$RemoveImageImpl<T>>
    implements _$$RemoveImageImplCopyWith<T, $Res> {
  __$$RemoveImageImplCopyWithImpl(
      _$RemoveImageImpl<T> _value, $Res Function(_$RemoveImageImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
  }) {
    return _then(_$RemoveImageImpl<T>(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveImageImpl<T> implements RemoveImage<T> {
  const _$RemoveImageImpl({required this.imageUrl});

  @override
  final String imageUrl;

  @override
  String toString() {
    return 'UploadImageState<$T>.removeImage(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImageImpl<T> &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImageImplCopyWith<T, _$RemoveImageImpl<T>> get copyWith =>
      __$$RemoveImageImplCopyWithImpl<T, _$RemoveImageImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) {
    return removeImage(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) {
    return removeImage?.call(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) {
    return removeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) {
    return removeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(this);
    }
    return orElse();
  }
}

abstract class RemoveImage<T> implements UploadImageState<T> {
  const factory RemoveImage({required final String imageUrl}) =
      _$RemoveImageImpl<T>;

  String get imageUrl;
  @JsonKey(ignore: true)
  _$$RemoveImageImplCopyWith<T, _$RemoveImageImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$UploadImageStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'UploadImageState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ladding,
    required TResult Function() sucess,
    required TResult Function(String imageUrl) removeImage,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ladding,
    TResult? Function()? sucess,
    TResult? Function(String imageUrl)? removeImage,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ladding,
    TResult Function()? sucess,
    TResult Function(String imageUrl)? removeImage,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) ladding,
    required TResult Function(Success<T> value) sucess,
    required TResult Function(RemoveImage<T> value) removeImage,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? ladding,
    TResult? Function(Success<T> value)? sucess,
    TResult? Function(RemoveImage<T> value)? removeImage,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? ladding,
    TResult Function(Success<T> value)? sucess,
    TResult Function(RemoveImage<T> value)? removeImage,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements UploadImageState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
