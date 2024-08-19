// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_edit_text_field_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$titleControllerNotifierHash() =>
    r'276d55123b1a4f45af62631524669d61baffeff0';

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

abstract class _$TitleControllerNotifier
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final String text;

  TextEditingController build(
    String text,
  );
}

/// See also [TitleControllerNotifier].
@ProviderFor(TitleControllerNotifier)
const titleControllerNotifierProvider = TitleControllerNotifierFamily();

/// See also [TitleControllerNotifier].
class TitleControllerNotifierFamily extends Family<TextEditingController> {
  /// See also [TitleControllerNotifier].
  const TitleControllerNotifierFamily();

  /// See also [TitleControllerNotifier].
  TitleControllerNotifierProvider call(
    String text,
  ) {
    return TitleControllerNotifierProvider(
      text,
    );
  }

  @override
  TitleControllerNotifierProvider getProviderOverride(
    covariant TitleControllerNotifierProvider provider,
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
  String? get name => r'titleControllerNotifierProvider';
}

/// See also [TitleControllerNotifier].
class TitleControllerNotifierProvider extends AutoDisposeNotifierProviderImpl<
    TitleControllerNotifier, TextEditingController> {
  /// See also [TitleControllerNotifier].
  TitleControllerNotifierProvider(
    String text,
  ) : this._internal(
          () => TitleControllerNotifier()..text = text,
          from: titleControllerNotifierProvider,
          name: r'titleControllerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$titleControllerNotifierHash,
          dependencies: TitleControllerNotifierFamily._dependencies,
          allTransitiveDependencies:
              TitleControllerNotifierFamily._allTransitiveDependencies,
          text: text,
        );

  TitleControllerNotifierProvider._internal(
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
    covariant TitleControllerNotifier notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(TitleControllerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TitleControllerNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<TitleControllerNotifier,
      TextEditingController> createElement() {
    return _TitleControllerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TitleControllerNotifierProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TitleControllerNotifierRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `text` of this provider.
  String get text;
}

class _TitleControllerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TitleControllerNotifier,
        TextEditingController> with TitleControllerNotifierRef {
  _TitleControllerNotifierProviderElement(super.provider);

  @override
  String get text => (origin as TitleControllerNotifierProvider).text;
}

String _$categoryNotifierHash() => r'98f5c779605edb81c41ef4e5d1d4795aaa16fb0d';

/// See also [CategoryNotifier].
@ProviderFor(CategoryNotifier)
final categoryNotifierProvider =
    AutoDisposeNotifierProvider<CategoryNotifier, String?>.internal(
  CategoryNotifier.new,
  name: r'categoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryNotifier = AutoDisposeNotifier<String?>;
String _$descriptionControllerNotifierHash() =>
    r'b4eafa28bbeeb660b61acfacdef5782165f30bce';

abstract class _$DescriptionControllerNotifier
    extends BuildlessAutoDisposeNotifier<TextEditingController> {
  late final String text;

  TextEditingController build(
    String text,
  );
}

/// See also [DescriptionControllerNotifier].
@ProviderFor(DescriptionControllerNotifier)
const descriptionControllerNotifierProvider =
    DescriptionControllerNotifierFamily();

/// See also [DescriptionControllerNotifier].
class DescriptionControllerNotifierFamily
    extends Family<TextEditingController> {
  /// See also [DescriptionControllerNotifier].
  const DescriptionControllerNotifierFamily();

  /// See also [DescriptionControllerNotifier].
  DescriptionControllerNotifierProvider call(
    String text,
  ) {
    return DescriptionControllerNotifierProvider(
      text,
    );
  }

  @override
  DescriptionControllerNotifierProvider getProviderOverride(
    covariant DescriptionControllerNotifierProvider provider,
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
  String? get name => r'descriptionControllerNotifierProvider';
}

/// See also [DescriptionControllerNotifier].
class DescriptionControllerNotifierProvider
    extends AutoDisposeNotifierProviderImpl<DescriptionControllerNotifier,
        TextEditingController> {
  /// See also [DescriptionControllerNotifier].
  DescriptionControllerNotifierProvider(
    String text,
  ) : this._internal(
          () => DescriptionControllerNotifier()..text = text,
          from: descriptionControllerNotifierProvider,
          name: r'descriptionControllerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$descriptionControllerNotifierHash,
          dependencies: DescriptionControllerNotifierFamily._dependencies,
          allTransitiveDependencies:
              DescriptionControllerNotifierFamily._allTransitiveDependencies,
          text: text,
        );

  DescriptionControllerNotifierProvider._internal(
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
    covariant DescriptionControllerNotifier notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(DescriptionControllerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DescriptionControllerNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<DescriptionControllerNotifier,
      TextEditingController> createElement() {
    return _DescriptionControllerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DescriptionControllerNotifierProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DescriptionControllerNotifierRef
    on AutoDisposeNotifierProviderRef<TextEditingController> {
  /// The parameter `text` of this provider.
  String get text;
}

class _DescriptionControllerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<DescriptionControllerNotifier,
        TextEditingController> with DescriptionControllerNotifierRef {
  _DescriptionControllerNotifierProviderElement(super.provider);

  @override
  String get text => (origin as DescriptionControllerNotifierProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
