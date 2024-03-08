import 'package:cash_withdraw/domain/auth/LoginDTO.dart';
import 'package:dartz/dartz.dart';

class LoginDTOValidation {
  static Either<String, LoginDTO> validate(String email, String password) {
    if (email.isEmpty) {
      return const Left('Email is required.');
    }

    if (password.isEmpty) {
      return const Left('Password is required.');
    }

    final emailValidation = _validateEmail(email);
    if (emailValidation.isLeft()) {
      return const Left('Invalid email"');
    }

    final passwordValidation = _validatePassword(password);
    if (passwordValidation.isLeft()) {
      return const Left('Invalid password');
    }

    final dto = LoginDTO(email: email, password: password);
    return Right(dto);
  }

  static Either<String, String> _validateEmail(String email) {
    const emailRegex = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
    final RegExp regex = RegExp(emailRegex);
    if (!regex.hasMatch(email)) {
      return const Left('Invalid email format.');
    }
    return Right(email);
  }

  static Either<String, String> _validatePassword(String password) {
    const passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    final RegExp regex = RegExp(passwordRegex);
    if (!regex.hasMatch(password)) {
      return const Left(
          'Invalid password format. Password must be at least 8 characters long and contain letters and numbers.');
    }
    return Right(password);
  }
}
