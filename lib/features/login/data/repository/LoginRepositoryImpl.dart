
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_file_upload/features/login/data/model/LoginResponse.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/error_handler.dart';
import '../../domain/repository/login_repo.dart';
import '../data_source/remote/dio_client.dart';

class LoginRepositoryImpl implements LoginRepository {

  final DioClient _dioClient;
  LoginRepositoryImpl(this._dioClient);

  @override
  Future<DataState<LoginResponse>> loginUser(Map<String, dynamic> data) async {

    try {
      final httpResponse = await _dioClient.post(
        uri: loginUrl,
        body: data,
      );

      if (httpResponse.statusCode == HttpStatus.ok) {
        final successRepoData = LoginResponse.fromJson(httpResponse.data);
        return DataSuccess(successRepoData);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.statusMessage,
            response: httpResponse,
            type: DioExceptionType.unknown,
            requestOptions: httpResponse.requestOptions,
          ),
        );
      }
    } catch (e) {
      return ErrorHandler.handleError(e);
    }
  }

}