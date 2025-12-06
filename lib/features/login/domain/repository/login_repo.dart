import '../../../../core/resources/data_state.dart';
import '../../data/model/LoginResponse.dart';

abstract class LoginRepository {
  Future<DataState<LoginResponse>> loginUser(Map<String, dynamic> data);
}