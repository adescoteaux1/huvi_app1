import 'package:huvi_app1/core/utils/auth_repository.dart';
import 'package:huvi_app1/core/utils/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  final Supabase _supabase;

  const SupabaseAuthRepository(this._supabase);

 
  @override
  Future<String> signInEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
 
    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }
 
    return userId;
  }
 
  @override
  Future<String> signUpEmailAndPassword(String email, String password) async {
    final response = await _supabase.client.auth.signUp(email: email, password: password);
 
    final userId = response.user?.id;
    if (userId == null) {
      throw UnimplementedError();
    }
 
    return userId;
  }
 
  @override
  Future<void> signOut() async {
    await _supabase.client.auth.signOut();
    return;
  }
}
