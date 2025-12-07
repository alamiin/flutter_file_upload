
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_file_upload/core/resources/data_state.dart';

import 'package:flutter_file_upload/features/dashboard/data/model/file_response.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/data/data_source/remote/dio_client.dart';
import '../../../../core/utils/error_handler.dart';
import '../../domain/repository/file_list_repository.dart';

class FileListRepositoryImpl implements FileListRepository{

  final DioClient _dioClient;
  FileListRepositoryImpl(this._dioClient);

  @override
  Future<DataState<FileResponse>> getList(String companyID) async{
    try {
      final httpResponse = await _dioClient.get(
        uri: getFileList + companyID,
      );

      if (httpResponse.statusCode == HttpStatus.ok) {
        final successRepoData = FileResponse.fromJson(httpResponse.data);
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

      print("Error in FileListRepositoryImpl: $e");
      return ErrorHandler.handleError(e);
    }
  }

}