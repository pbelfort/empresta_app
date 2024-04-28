import 'package:empresta/app/data/repository/remote/covenant/i_covenant_repository.dart';
import 'package:empresta/app/data/repository/remote/simulation/i_simulation_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../base/global_controller.dart';
import '../../data/repository/remote/institution/i_institution_repository.dart';
import '../../domain/entities/covenant_entity.dart';
import '../../domain/entities/institution_entity.dart';
import '../../domain/entities/simulation_entity.dart';
import '../../domain/entities/simulation_remote_entity.dart';
import '../../usecase/simulation_usecases.dart';

class HomePageController extends IGlobalController {
  //repositories declarations
  final ICovenantRepository _iCovenantRepository;
  final IInstitutionRepository _iInstitutionRepository;
  final ISimulationRepository _iSimulationRepository;

  //dropdown keys declarations
  final GlobalKey<FormFieldState> dropdownParcelsKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> dropdownCovenantsKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> dropdownInstitutionsKey =
      GlobalKey<FormFieldState>();

  //text editing controllers declarations
  TextEditingController moneyTextController = TextEditingController();

  //rx variables declarations
  RxList<CovenantEntity> covenantList = <CovenantEntity>[].obs;
  RxList<InstitutionEntity> institutionList = <InstitutionEntity>[].obs;
  RxList<SimulationEntity> simulations = <SimulationEntity>[].obs;
  RxBool simulateLoading = false.obs;
  RxBool blockSimulateButton = true.obs;

  //late variables declarations
  late SimulationRemoteEntity simulationRemoteEntity;

  HomePageController(
      {required ICovenantRepository iCovenantRepository,
      required IInstitutionRepository iInstitutionRepository,
      required ISimulationRepository iSimulationRepository})
      : _iCovenantRepository = iCovenantRepository,
        _iInstitutionRepository = iInstitutionRepository,
        _iSimulationRepository = iSimulationRepository;

  @override
  Future<void> onInit() async {
    showLoading.value = true;
    _initSimulationRemoteEntity();
    _getCovenantsDependencies();
    _getInstitutionsDependencies();
    showLoading.value = false;
    super.onInit();
  }

  ///get simulations for simulation entity
  Future<void> simulate() async {
    if (blockSimulateButton.value) return;
    simulateLoading.value = true;
    simulations.value = await SimulationUsecases.getSimulation(
      iSimulationRepository: _iSimulationRepository,
      simulationRemoteEntity: simulationRemoteEntity,
    );
    simulateLoading.value = false;
    return;
  }

  Future<void> _getCovenantsDependencies() async {
    final covenantListApi =
        await SimulationUsecases.getCovenants(_iCovenantRepository);
    covenantList.addAll(covenantListApi);
  }

  Future<void> _getInstitutionsDependencies() async {
    final institutionListApi =
        await SimulationUsecases.getInstitutions(_iInstitutionRepository);
    institutionList.addAll(institutionListApi);
  }

  void moneyTextInputCallback(String value) {
    if (value.isEmpty) {
      simulationRemoteEntity.loanValue = 0.0;
      blockSimulateButton.value = true;

      //empty value guard
      return;
    }
    final replacedValue = value.replaceAll(',', '');
    simulationRemoteEntity.loanValue = double.parse(replacedValue);
    moneyTextController.text = 'R\$ $value';
    blockSimulateButton.value = false;
  }

  ///refresh all fields values
  void refreshAll() {
    blockSimulateButton.value = true;
    _initSimulationRemoteEntity();
    moneyTextController.clear();
    dropdownParcelsKey.currentState!.reset();
    dropdownCovenantsKey.currentState!.reset();
    dropdownInstitutionsKey.currentState!.reset();
  }

  ///initialize simulation entity
  void _initSimulationRemoteEntity() {
    simulationRemoteEntity = SimulationRemoteEntity(
      loanValue: 0,
      institutions: [],
      covenants: [],
      parcelNumber: 0,
    );
  }
}
