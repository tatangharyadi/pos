// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItemModifier _$CartItemModifierFromJson(Map<String, dynamic> json) {
  return _CartItemModifier.fromJson(json);
}

/// @nodoc
mixin _$CartItemModifier {
  String get objectId => throw _privateConstructorUsedError;
  String get collectionId => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemModifierCopyWith<CartItemModifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemModifierCopyWith<$Res> {
  factory $CartItemModifierCopyWith(
          CartItemModifier value, $Res Function(CartItemModifier) then) =
      _$CartItemModifierCopyWithImpl<$Res, CartItemModifier>;
  @useResult
  $Res call(
      {String objectId,
      String collectionId,
      String? sku,
      String name,
      double unitPrice,
      bool isSelected});
}

/// @nodoc
class _$CartItemModifierCopyWithImpl<$Res, $Val extends CartItemModifier>
    implements $CartItemModifierCopyWith<$Res> {
  _$CartItemModifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? collectionId = null,
    Object? sku = freezed,
    Object? name = null,
    Object? unitPrice = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemModifierImplCopyWith<$Res>
    implements $CartItemModifierCopyWith<$Res> {
  factory _$$CartItemModifierImplCopyWith(_$CartItemModifierImpl value,
          $Res Function(_$CartItemModifierImpl) then) =
      __$$CartItemModifierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String objectId,
      String collectionId,
      String? sku,
      String name,
      double unitPrice,
      bool isSelected});
}

/// @nodoc
class __$$CartItemModifierImplCopyWithImpl<$Res>
    extends _$CartItemModifierCopyWithImpl<$Res, _$CartItemModifierImpl>
    implements _$$CartItemModifierImplCopyWith<$Res> {
  __$$CartItemModifierImplCopyWithImpl(_$CartItemModifierImpl _value,
      $Res Function(_$CartItemModifierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? collectionId = null,
    Object? sku = freezed,
    Object? name = null,
    Object? unitPrice = null,
    Object? isSelected = null,
  }) {
    return _then(_$CartItemModifierImpl(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemModifierImpl implements _CartItemModifier {
  _$CartItemModifierImpl(
      {required this.objectId,
      required this.collectionId,
      this.sku,
      required this.name,
      this.unitPrice = 0.0,
      this.isSelected = false});

  factory _$CartItemModifierImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemModifierImplFromJson(json);

  @override
  final String objectId;
  @override
  final String collectionId;
  @override
  final String? sku;
  @override
  final String name;
  @override
  @JsonKey()
  final double unitPrice;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'CartItemModifier(objectId: $objectId, collectionId: $collectionId, sku: $sku, name: $name, unitPrice: $unitPrice, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemModifierImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectId, collectionId, sku, name, unitPrice, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemModifierImplCopyWith<_$CartItemModifierImpl> get copyWith =>
      __$$CartItemModifierImplCopyWithImpl<_$CartItemModifierImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemModifierImplToJson(
      this,
    );
  }
}

abstract class _CartItemModifier implements CartItemModifier {
  factory _CartItemModifier(
      {required final String objectId,
      required final String collectionId,
      final String? sku,
      required final String name,
      final double unitPrice,
      final bool isSelected}) = _$CartItemModifierImpl;

  factory _CartItemModifier.fromJson(Map<String, dynamic> json) =
      _$CartItemModifierImpl.fromJson;

  @override
  String get objectId;
  @override
  String get collectionId;
  @override
  String? get sku;
  @override
  String get name;
  @override
  double get unitPrice;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$CartItemModifierImplCopyWith<_$CartItemModifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  String get orderLineId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  List<CartItemModifier> get modifiers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String orderLineId,
      String productId,
      String sku,
      String name,
      double unitPrice,
      int qty,
      List<CartItemModifier> modifiers});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderLineId = null,
    Object? productId = null,
    Object? sku = null,
    Object? name = null,
    Object? unitPrice = null,
    Object? qty = null,
    Object? modifiers = null,
  }) {
    return _then(_value.copyWith(
      orderLineId: null == orderLineId
          ? _value.orderLineId
          : orderLineId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<CartItemModifier>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderLineId,
      String productId,
      String sku,
      String name,
      double unitPrice,
      int qty,
      List<CartItemModifier> modifiers});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderLineId = null,
    Object? productId = null,
    Object? sku = null,
    Object? name = null,
    Object? unitPrice = null,
    Object? qty = null,
    Object? modifiers = null,
  }) {
    return _then(_$CartItemImpl(
      orderLineId: null == orderLineId
          ? _value.orderLineId
          : orderLineId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<CartItemModifier>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  _$CartItemImpl(
      {required this.orderLineId,
      required this.productId,
      required this.sku,
      required this.name,
      this.unitPrice = 0.0,
      required this.qty,
      this.modifiers = const []});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final String orderLineId;
  @override
  final String productId;
  @override
  final String sku;
  @override
  final String name;
  @override
  @JsonKey()
  final double unitPrice;
  @override
  final int qty;
  @override
  @JsonKey()
  final List<CartItemModifier> modifiers;

  @override
  String toString() {
    return 'CartItem(orderLineId: $orderLineId, productId: $productId, sku: $sku, name: $name, unitPrice: $unitPrice, qty: $qty, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.orderLineId, orderLineId) ||
                other.orderLineId == orderLineId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            const DeepCollectionEquality().equals(other.modifiers, modifiers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderLineId, productId, sku,
      name, unitPrice, qty, const DeepCollectionEquality().hash(modifiers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  factory _CartItem(
      {required final String orderLineId,
      required final String productId,
      required final String sku,
      required final String name,
      final double unitPrice,
      required final int qty,
      final List<CartItemModifier> modifiers}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  String get orderLineId;
  @override
  String get productId;
  @override
  String get sku;
  @override
  String get name;
  @override
  double get unitPrice;
  @override
  int get qty;
  @override
  List<CartItemModifier> get modifiers;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
