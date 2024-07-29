import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/model/src/user.dart';
import 'package:serene_track/view/auth_page/provider/auth_notifier.dart';

final userAsyncValueProvider = FutureProvider<User?>((ref) async {
  final User? user = await ref.read(authProvider.notifier).getUser();
  return user;
});
