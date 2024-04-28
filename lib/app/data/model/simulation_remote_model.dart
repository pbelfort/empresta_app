import 'package:empresta/app/domain/entities/simulation_remote_entity.dart';

class SimulationRemoteModel extends SimulationRemoteEntity {
  SimulationRemoteModel({
    required super.loanValue,
    required super.institutions,
    required super.covenants,
    required super.parcelNumber,
  });

  Map<String, dynamic> toMapApi() => {
        'valor_emprestimo': loanValue,
        'instituicoes': institutions.isEmpty ? [] : [institutions.first],
        'convenios': covenants.isEmpty ? [] : [covenants.first],
        'parcela': parcelNumber,
      };

  factory SimulationRemoteModel.fromEntity(SimulationRemoteEntity entity) {
    return SimulationRemoteModel(
      loanValue: entity.loanValue,
      institutions: entity.institutions,
      covenants: entity.covenants,
      parcelNumber: entity.parcelNumber,
    );
  }
}
