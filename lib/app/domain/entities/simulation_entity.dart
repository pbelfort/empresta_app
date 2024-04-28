import 'package:empresta/app/domain/entities/basic_simulation_entity.dart';

class SimulationEntity {
  SimulationEntity({
    required this.institution,
    required this.simulations,
  });

  final String institution;
  final List<SimulationBasicEntity> simulations;
}
