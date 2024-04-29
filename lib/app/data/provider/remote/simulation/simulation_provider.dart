import 'dart:convert';

import 'package:empresta/app/domain/entities/simulation_entity.dart';

import '../../../../base/enviroment.dart';
import '../../../../domain/entities/simulation_remote_entity.dart';
import '../../../model/simulation_model.dart';
import '../../../model/simulation_remote_model.dart';
import 'i_simulation_provider.dart';
import 'package:http/http.dart' as http;

class SimulationProvider implements ISimulationProvider {
  @override
  Future<List<SimulationEntity>?> getSimulation(
    SimulationRemoteEntity simulationRemoteEntity,
  ) async {
    try {
      final List<SimulationEntity> listResult = [];
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/simular'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            SimulationRemoteModel.fromEntity(simulationRemoteEntity)
                .toMapApi()),
      );
      if (response.body == '[]') return [];

      if (response.statusCode == 200) {
        final decodedResponseList =
            json.decode((response.body)) as Map<String, dynamic>;

        decodedResponseList.forEach((key, value) {
          if (value is List) {
            listResult.add(
              SimulationModel.fromJson(
                key,
                value,
              ),
            );
          }
          if (value is Map) {
            for (var e in value.entries) {
              listResult.add(
                SimulationModel.fromJson(
                  key,
                  e,
                ),
              );
            }
          }
        });

        return listResult;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
