import '../../../../domain/entities/simulation_entity.dart';
import '../../../../domain/entities/simulation_remote_entity.dart';

abstract class ISimulationProvider {
  Future<List<SimulationEntity>?> getSimulation(
    SimulationRemoteEntity simulationRemoteEntity,
  );
}
