import 'package:bloct_training/data/models/model.dart';
import 'package:bloct_training/data/web_services/web_service.dart';

class MyRepository {
  final WebService webService;

  MyRepository(this.webService);

  Future<List<Results>?> getALl() async {
    final films = await webService.getALl();

    return films?.map((f) => Results.fromJson(f)).toList();
  }
}
