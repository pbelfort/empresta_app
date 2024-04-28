import 'dart:convert';
import '../../../../base/enviroment.dart';
import '../../../../domain/entities/covenant_entity.dart';
import '../../../model/covenant_model.dart';
import 'i_covenant_provider.dart';
import 'package:http/http.dart' as http;

class CovenantProvider implements ICovenantProvider {
  @override
  Future<List<CovenantEntity>?> getCovenants() async {
    try {
      final response = await http.get(
        Uri.parse('${AppEnviroment.baseUrl}/convenio'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponseList = json.decode((response.body)) as List;
        return decodedResponseList
            .map((e) => CovenantModel.fromMap(e))
            .cast<CovenantEntity>()
            .toList();
      }
      return null;
    } catch (_) {}
    return null;
  }
}
