import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/login_usecase.dart';


class LoginProvider with ChangeNotifier{

  final LoginUseCase loginUseCase;
  final SharedPreferences sharedPreferences;
  LoginProvider({required this.loginUseCase, required this.sharedPreferences});


  bool isLoading = false;
  String? error;


  void updateLoader(bool state){
    isLoading = state;
    notifyListeners();
  }

  void clearError(){
    error = null;
    notifyListeners();
  }

  void loginUser(String username, String password) async {

    updateLoader(true);
     Map<String, dynamic> params = {
      'username': username,
      'password': password,
     };

    final dataState = await loginUseCase(params: params);
    switch(dataState){
      case DataSuccess():{
        var accessToken = dataState.data!.accessToken;
        await sharedPreferences.setString(accessToken,  accessToken);
        updateLoader(false);
      }
      case DataFailed():{
        error = dataState.error!.message;
        updateLoader(false);
      }
    }

  }


}