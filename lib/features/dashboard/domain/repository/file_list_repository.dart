import '../../../../core/resources/data_state.dart';
import '../../data/model/file_response.dart';


abstract class FileListRepository {
  Future<DataState<FileResponse>> getList(String companyID);
}