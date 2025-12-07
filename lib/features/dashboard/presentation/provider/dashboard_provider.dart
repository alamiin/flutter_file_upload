
import 'package:flutter/foundation.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/file_info.dart';
import '../../domain/usecase/file_list_usecase.dart';

class DashboardProvider with ChangeNotifier{
  // Implementation of the DashboardProvider

  final FileListUseCase fileListUseCase;
  DashboardProvider({required this.fileListUseCase});

  bool isLoading = false;
  String message = "";
   List<FileInfo> dataList = [];

  void updateLoader(bool state){
    isLoading = state;
    notifyListeners();
  }

  void getFileList() async {

    updateLoader(true);

    final dataState = await fileListUseCase(params: "2");

    switch(dataState){
      case DataSuccess():{
        dataList = [];
        dataList = dataState.data!.dataList;
      }
      case DataFailed():{
        message = dataState.error!.message!;
      }
    }

    updateLoader(false);

  }
}