import '../../../../domain/entities/simulation_entity.dart';
import '../../../../domain/entities/simulation_remote_entity.dart';
import '../../../provider/remote/simulation/i_simulation_provider.dart';
import 'i_simulation_repository.dart';

class SimulationRepository implements ISimulationRepository {
  final ISimulationProvider provider;
  SimulationRepository({required this.provider});

  @override
  Future<List<SimulationEntity>?> getSimulation(
    SimulationRemoteEntity simulationRemoteEntity,
  ) async {
    return await provider.getSimulation(simulationRemoteEntity);
  }
}
