import 'package:cash_withdraw/domain/auth/LoginDTOValidation.dart';
import 'package:cash_withdraw/domain/auth/auth_failure.dart';
import 'package:cash_withdraw/models/user_model.dart';
import 'package:cash_withdraw/network/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider = AuthDataProvider();

  Future<Either<AuthException, UserModel>> login(
      String email, String password) async {
    final validation = LoginDTOValidation.validate(email, password);
    if (validation.isLeft()) {
      return Left(AuthException(validation.fold((error) => error, (_) => '')));
    }

    try {
      final user = await authDataProvider.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(AuthException('Login failed: $e'));
    }
  }

  Future<Either<AuthException, void>> forgotPassword(String email) async {
    try {
      await authDataProvider.forgotPassword(email);
      return const Right(null);
    } catch (e) {
      return Left(AuthException('Forgot password failed: $e'));
    }
  }

  Future<Either<AuthException, String>> getUserToken() async {
    try {
      final token = await authDataProvider.getUserToken();
      return Right(token);
    } catch (e) {
      return Left(AuthException('Failed to get user token: $e'));
    }
  }

  Future<void> signOut() async {
    await authDataProvider.signOut();
  }
}
