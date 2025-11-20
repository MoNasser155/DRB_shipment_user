import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'failures.dart';

class FirebaseFailure extends Failure {
  const FirebaseFailure({
    required super.code,
    required super.message,
    super.cause,
    super.stackTrace,
  });

  factory FirebaseFailure.from(Object error, [StackTrace? stack]) {
    if (error is SocketException || error is HandshakeException) {
      return FirebaseFailure(
        code: 'network-unavailable',
        message:
            'Network is unavailable. Please check your connection and try again.',
        cause: error,
        stackTrace: stack,
      );
    }

    if (error is TimeoutException) {
      return FirebaseFailure(
        code: 'timeout',
        message: 'The operation timed out. Please try again.',
        cause: error,
        stackTrace: stack,
      );
    }

    if (error is FirebaseAuthException) {
      final msg =
          _authMessages[error.code] ??
          error.message ??
          'An authentication error occurred.';
      return FirebaseFailure(
        code: 'auth/${error.code}',
        message: msg,
        cause: error,
        stackTrace: stack,
      );
    }

    if (error is FirebaseException) {
      final msg =
          _firebaseMessages[error.code] ??
          error.message ??
          'A Firebase service error occurred.';
      return FirebaseFailure(
        code: 'firebase/${error.code}',
        message: msg,
        cause: error,
        stackTrace: stack,
      );
    }

    if (error is PlatformException) {
      final msg =
          _platformMessages[error.code] ??
          error.message ??
          'A platform error occurred. Please try again.';
      return FirebaseFailure(
        code: 'platform/${error.code}',
        message: msg,
        cause: error,
        stackTrace: stack,
      );
    }

    if (error is FormatException) {
      return FirebaseFailure(
        code: 'format',
        message: 'Invalid data format.',
        cause: error,
        stackTrace: stack,
      );
    }

    return FirebaseFailure(
      code: 'unknown',
      message: 'An unexpected error occurred.',
      cause: error,
      stackTrace: stack,
    );
  }

  static const Map<String, String> _authMessages = {
    'invalid-email': 'The email address is not valid.',
    'user-disabled': 'This user account has been disabled. Contact support.',
    'user-not-found': 'No user found for the given credentials.',
    'wrong-password': 'The password is incorrect.',
    'email-already-in-use':
        'The email address is already in use by another account.',
    'operation-not-allowed':
        'This operation is not allowed. Please contact support.',
    'weak-password': 'The password is too weak.',
    'too-many-requests': 'Too many attempts. Please try again later.',
    'invalid-credential': 'The credential is invalid or expired.',
    'account-exists-with-different-credential':
        'An account already exists with a different credential. Try another sign-in method.',
    'requires-recent-login':
        'Please re-authenticate to perform this operation.',
    'network-request-failed':
        'Failed to connect to the server. Check your network.',
    'sign_in_canceled': 'Sign-in flow was canceled.',
    'popup_closed_by_user': 'The sign-in popup was closed before completion.',
  };

  static const Map<String, String> _firebaseMessages = {
    'permission-denied': 'You do not have permission to access this resource.',
    'not-found': 'The requested resource was not found.',
    'already-exists': 'The resource already exists.',
    'cancelled': 'The operation was cancelled.',
    'aborted': 'The operation was aborted.',
    'deadline-exceeded': 'The operation timed out. Please try again.',
    'unauthenticated': 'Authentication is required.',
    'resource-exhausted': 'Quota exceeded or resource exhausted. Try later.',
    'unavailable': 'The service is currently unavailable. Try again later.',
    'data-loss': 'Data loss occurred. Please try again later.',
    'failed-precondition': 'The operation is not allowed in the current state.',
  };

  static const Map<String, String> _platformMessages = {
    'network_error': 'Network error occurred.',
    'sign_in_failed': 'Sign-in failed.',
    'sign_in_required': 'Sign-in is required to complete this action.',
    'canceled': 'The operation was cancelled.',
  };
}
