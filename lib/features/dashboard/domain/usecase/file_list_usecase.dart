
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/file_response.dart';
import '../repository/file_list_repository.dart';

class FileListUseCase implements UseCase<DataState<FileResponse>, String> {
  final FileListRepository repository;

  FileListUseCase(this.repository);

  @override
  Future<DataState<FileResponse>> call({required String params}) async {
    return await repository.getList(params);
  }

}