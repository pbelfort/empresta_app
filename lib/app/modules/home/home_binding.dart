import 'package:empresta/app/data/provider/remote/simulation/i_simulation_provider.dart';
import 'package:empresta/app/data/repository/remote/covenant/i_covenant_repository.dart';
import 'package:get/get.dart';

import '../../data/provider/remote/covenant/covenant_provider.dart';
import '../../data/provider/remote/covenant/i_covenant_provider.dart';
import '../../data/provider/remote/institution/i_institution_provider.dart';
import '../../data/provider/remote/institution/institution_provider.dart';
import '../../data/provider/remote/simulation/simulation_provider.dart';
import '../../data/repository/remote/covenant/covenant_repository.dart';
import '../../data/repository/remote/institution/i_institution_repository.dart';
import '../../data/repository/remote/institution/institution_repository.dart';
import '../../data/repository/remote/simulation/i_simulation_repository.dart';
import '../../data/repository/remote/simulation/simulation_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICovenantProvider>(
      () => CovenantProvider(),
    );
    Get.lazyPut<ICovenantRepository>(
      () => CovenantRepository(
        provider: Get.find<ICovenantProvider>(),
      ),
    );
    Get.lazyPut<IInstitutionProvider>(
      () => InstitutionProvider(),
    );
    Get.lazyPut<IInstitutionRepository>(
      () => InstitutionRepository(
        provider: Get.find<IInstitutionProvider>(),
      ),
    );
    Get.lazyPut<ISimulationProvider>(
      () => SimulationProvider(),
    );
    Get.lazyPut<ISimulationRepository>(
      () => SimulationRepository(
        provider: Get.find<ISimulationProvider>(),
      ),
    );
    Get.put(
      HomePageController(
        iCovenantRepository: Get.find<ICovenantRepository>(),
        iInstitutionRepository: Get.find<IInstitutionRepository>(),
        iSimulationRepository: Get.find<ISimulationRepository>(),
      ),
    );
  }
}
