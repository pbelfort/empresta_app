class SimulationRemoteEntity {
  double loanValue;
  List<String> institutions;
  List<String> covenants;
  int parcelNumber;

  SimulationRemoteEntity({
    required this.loanValue,
    required this.institutions,
    required this.covenants,
    required this.parcelNumber,
  });
}
