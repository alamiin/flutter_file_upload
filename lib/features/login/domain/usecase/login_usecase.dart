import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/LoginResponse.dart';
import '../repository/login_repo.dart';

class LoginUseCase implements UseCase<DataState<LoginResponse>, Map<String, dynamic>> {

  final LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);

  @override
  Future<DataState<LoginResponse>> call( {required Map<String, dynamic> params}) async {
    params['grant_type'] = "password";
    params['scope'] = "profile";
    return await _loginRepository.loginUser(params);
  }
}