import 'package:empresta/app/domain/entities/basic_simulation_entity.dart';
import '../../domain/entities/simulation_entity.dart';
import 'simulation_basic_model.dart';

class SimulationModel extends SimulationEntity {
  SimulationModel({
    required super.institution,
    required super.simulations,
  });

  factory SimulationModel.fromEntity(SimulationEntity entity) {
    return SimulationModel(
      institution: entity.institution,
      simulations: entity.simulations,
    );
  }

  factory SimulationModel.fromJson(
    String key,
    dynamic value,
  ) {
    return SimulationModel(
      institution: key,
      simulations: _transactionListMap(value),
    );
  }

  static List<SimulationBasicEntity> _transactionListMap(json) {
    if (json is List) {
      return json
          .map((e) => SimulationBasicModel.fromMap(e))
          .cast<SimulationBasicEntity>()
          .toList();
    }

    if (json.value is Map) {
      return [SimulationBasicModel.fromMap(json.value)];
    }
    return [];
  }
}
