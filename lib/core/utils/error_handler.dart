// lib/app/core/utils/error_handler.dart
import 'package:dio/dio.dart';
import '../resources/data_state.dart';

class ErrorHandler {
  static DataState<T> handleError<T>(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return DataFailed<T>(
            DioException(
              requestOptions: error.requestOptions,
              message:
              'Connection timeout. Please check your internet connection.',
            ),
          );

        case DioExceptionType.connectionError:
          return DataFailed<T>(
            DioException(
              requestOptions: error.requestOptions,
              message: 'No internet connection',
            ),
          );

        case DioExceptionType.badResponse:
          String message = 'Something went wrong';

          final statusCode = error.response?.statusCode;
          if (statusCode == 404) {
            message = 'Resource not found';
          } else if (statusCode == 500) {
            message = 'Server error';
          }

          return DataFailed<T>(
            DioException(
              requestOptions: error.requestOptions,
              message: message,
            ),
          );

        default:
          return DataFailed<T>(
            DioException(
              requestOptions: error.requestOptions,
              message: 'Unexpected error occurred',
            ),
          );
      }
    }

    return DataFailed<T>(
      DioException(
        requestOptions: RequestOptions(path: ''),
        message: error.toString(),
      ),
    );
  }
}
