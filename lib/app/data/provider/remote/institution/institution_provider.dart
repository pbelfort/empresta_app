import 'dart:convert';

import '../../../../base/enviroment.dart';
import '../../../../domain/entities/institution_entity.dart';
import '../../../model/institution_model.dart';
import 'i_institution_provider.dart';
import 'package:http/http.dart' as http;

class InstitutionProvider implements IInstitutionProvider {
  @override
  Future<List<InstitutionEntity>?> getInstitutions() async {
    try {
      final response = await http.get(
        Uri.parse('${AppEnviroment.baseUrl}/instituicao'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponseList = json.decode((response.body)) as List;
        return decodedResponseList
            .map((e) => InstitutionModel.fromMap(e))
            .cast<InstitutionEntity>()
            .toList();
      }
      return null;
    } catch (_) {}
    return null;
  }
}
