// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_text_field_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nameControllerNotifierHash() =>
    r'20d8fbbc279eb36a1b06cd837c830bef9c21ed61';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NameControllerNotifier
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final String text;

  TextEditingController build(
    String text,
  );
}

/// See also [NameControllerNotifier].
@ProviderFor(NameControllerNotifier)
const nameControllerNotifierProvider = NameControllerNotifierFamily();

/// See also [NameControllerNotifier].
class NameControllerNotifierFamily extends Family<TextEditingController> {
  /// See also [NameControllerNotifier].
  const NameControllerNotifierFamily();

  /// See also [NameControllerNotifier].
  NameControllerNotifierProvider call(
    String text,
  ) {
    return NameControllerNotifierProvider(
      text,
    );
  }

  @override
  NameControllerNotifierProvider getProviderOverride(
    covariant NameControllerNotifierProvider provider,
  ) {
    return call(
      provider.text,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nameControllerNotifierProvider';
}

/// See also [NameControllerNotifier].
class NameControllerNotifierProvider extends AutoDisposeNotifierProviderImpl<
    NameControllerNotifier, TextEditingController> {
  /// See also [NameControllerNotifier].
  NameControllerNotifierProvider(
    String text,
  ) : this._internal(
          () => NameControllerNotifier()..text = text,
          from: nameControllerNotifierProvider,
          name: r'nameControllerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nameControllerNotifierHash,
          dependencies: NameControllerNotifierFamily._dependencies,
          allTransitiveDependencies:
              NameControllerNotifierFamily._allTransitiveDependencies,
          text: text,
        );

  NameControllerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  TextEditingController runNotifierBuild(
    covariant NameControllerNotifier notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(NameControllerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NameControllerNotifierProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NameControllerNotifier,
      TextEditingController> createElement() {
    return _NameControllerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NameControllerNotifierProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NameControllerNotifierRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `text` of this provider.
  String get text;
}

class _NameControllerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<NameControllerNotifier,
        TextEditingController> with NameControllerNotifierRef {
  _NameControllerNotifierProviderElement(super.provider);

  @override
  String get text => (origin as NameControllerNotifierProvider).text;
}

String _$shortTermGorlControllerNotifierHash() =>
    r'bcac2c77e6282c86271825f26d5fdbf19438b696';

abstract class _$ShortTermGorlControllerNotifier
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final String text;

  TextEditingController build(
    String text,
  );
}

/// See also [ShortTermGorlControllerNotifier].
@ProviderFor(ShortTermGorlControllerNotifier)
const shortTermGorlControllerNotifierProvider =
    ShortTermGorlControllerNotifierFamily();

/// See also [ShortTermGorlControllerNotifier].
class ShortTermGorlControllerNotifierFamily
    extends Family<TextEditingController> {
  /// See also [ShortTermGorlControllerNotifier].
  const ShortTermGorlControllerNotifierFamily();

  /// See also [ShortTermGorlControllerNotifier].
  ShortTermGorlControllerNotifierProvider call(
    String text,
  ) {
    return ShortTermGorlControllerNotifierProvider(
      text,
    );
  }

  @override
  ShortTermGorlControllerNotifierProvider getProviderOverride(
    covariant ShortTermGorlControllerNotifierProvider provider,
  ) {
    return call(
      provider.text,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shortTermGorlControllerNotifierProvider';
}

/// See also [ShortTermGorlControllerNotifier].
class ShortTermGorlControllerNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ShortTermGorlControllerNotifier,
        TextEditingController> {
  /// See also [ShortTermGorlControllerNotifier].
  ShortTermGorlControllerNotifierProvider(
    String text,
  ) : this._internal(
          () => ShortTermGorlControllerNotifier()..text = text,
          from: shortTermGorlControllerNotifierProvider,
          name: r'shortTermGorlControllerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shortTermGorlControllerNotifierHash,
          dependencies: ShortTermGorlControllerNotifierFamily._dependencies,
          allTransitiveDependencies:
              ShortTermGorlControllerNotifierFamily._allTransitiveDependencies,
          text: text,
        );

  ShortTermGorlControllerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  TextEditingController runNotifierBuild(
    covariant ShortTermGorlControllerNotifier notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(ShortTermGorlControllerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShortTermGorlControllerNotifierProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ShortTermGorlControllerNotifier,
      TextEditingController> createElement() {
    return _ShortTermGorlControllerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShortTermGorlControllerNotifierProvider &&
        other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShortTermGorlControllerNotifierRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `text` of this provider.
  String get text;
}

class _ShortTermGorlControllerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ShortTermGorlControllerNotifier,
        TextEditingController> with ShortTermGorlControllerNotifierRef {
  _ShortTermGorlControllerNotifierProviderElement(super.provider);

  @override
  String get text => (origin as ShortTermGorlControllerNotifierProvider).text;
}

String _$longTermGorlControllerNotifierHash() =>
    r'805deed39287c4a73c0e865c85b3cbe707c0991b';

abstract class _$LongTermGorlControllerNotifier
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final String text;

  TextEditingController build(
    String text,
  );
}

/// See also [LongTermGorlControllerNotifier].
@ProviderFor(LongTermGorlControllerNotifier)
const longTermGorlControllerNotifierProvider =
    LongTermGorlControllerNotifierFamily();

/// See also [LongTermGorlControllerNotifier].
class LongTermGorlControllerNotifierFamily
    extends Family<TextEditingController> {
  /// See also [LongTermGorlControllerNotifier].
  const LongTermGorlControllerNotifierFamily();

  /// See also [LongTermGorlControllerNotifier].
  LongTermGorlControllerNotifierProvider call(
    String text,
  ) {
    return LongTermGorlControllerNotifierProvider(
      text,
    );
  }

  @override
  LongTermGorlControllerNotifierProvider getProviderOverride(
    covariant LongTermGorlControllerNotifierProvider provider,
  ) {
    return call(
      provider.text,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'longTermGorlControllerNotifierProvider';
}

/// See also [LongTermGorlControllerNotifier].
class LongTermGorlControllerNotifierProvider
    extends AutoDisposeNotifierProviderImpl<LongTermGorlControllerNotifier,
        TextEditingController> {
  /// See also [LongTermGorlControllerNotifier].
  LongTermGorlControllerNotifierProvider(
    String text,
  ) : this._internal(
          () => LongTermGorlControllerNotifier()..text = text,
          from: longTermGorlControllerNotifierProvider,
          name: r'longTermGorlControllerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$longTermGorlControllerNotifierHash,
          dependencies: LongTermGorlControllerNotifierFamily._dependencies,
          allTransitiveDependencies:
              LongTermGorlControllerNotifierFamily._allTransitiveDependencies,
          text: text,
        );

  LongTermGorlControllerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  TextEditingController runNotifierBuild(
    covariant LongTermGorlControllerNotifier notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(LongTermGorlControllerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LongTermGorlControllerNotifierProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LongTermGorlControllerNotifier,
      TextEditingController> createElement() {
    return _LongTermGorlControllerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LongTermGorlControllerNotifierProvider &&
        other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LongTermGorlControllerNotifierRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `text` of this provider.
  String get text;
}

class _LongTermGorlControllerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<LongTermGorlControllerNotifier,
        TextEditingController> with LongTermGorlControllerNotifierRef {
  _LongTermGorlControllerNotifierProviderElement(super.provider);

  @override
  String get text => (origin as LongTermGorlControllerNotifierProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
