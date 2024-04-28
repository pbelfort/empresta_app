import 'package:empresta/app/data/repository/remote/institution/i_institution_repository.dart';
import 'package:empresta/app/data/repository/remote/simulation/i_simulation_repository.dart';
import 'package:empresta/app/domain/entities/simulation_remote_entity.dart';
import 'package:get/get.dart';

import '../data/repository/remote/covenant/i_covenant_repository.dart';
import '../domain/entities/covenant_entity.dart';
import '../domain/entities/institution_entity.dart';
import '../domain/entities/simulation_entity.dart';

abstract class SimulationUsecases {
  ///get covenants list
  static Future<List<CovenantEntity>> getCovenants(
      ICovenantRepository iCovenantRepository) async {
    return await iCovenantRepository.getCovenants() ?? [];
  }

  ///get institutions list
  static Future<List<InstitutionEntity>> getInstitutions(
      IInstitutionRepository iInstitutionRepository) async {
    return await iInstitutionRepository.getInstitutions() ?? [];
  }

  ///get simulations
  static Future<List<SimulationEntity>> getSimulation({
    required ISimulationRepository iSimulationRepository,
    required SimulationRemoteEntity simulationRemoteEntity,
  }) async {
    final simulation =
        await iSimulationRepository.getSimulation(simulationRemoteEntity);
    await 0.3.delay();
    return simulation ?? [];
  }
}
