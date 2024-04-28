import '../../domain/entities/basic_simulation_entity.dart';

class SimulationBasicModel extends SimulationBasicEntity {
  SimulationBasicModel({
    required super.covenant,
    required super.installmentValue,
    required super.installments,
    required super.tax,
  });

  factory SimulationBasicModel.fromEntity(SimulationBasicEntity entity) {
    return SimulationBasicModel(
      covenant: entity.covenant,
      installmentValue: entity.installmentValue,
      installments: entity.installments,
      tax: entity.tax,
    );
  }

  factory SimulationBasicModel.fromMap(dynamic map) {
    return SimulationBasicModel(
      covenant: map['convenio'],
      installmentValue: _doubleParser(map['valor_parcela']) ?? 0.0,
      installments: map['parcelas'],
      tax: _doubleParser(map['taxa']) ?? 0.0,
    );
  }
}

double? _doubleParser(dynamic map) {
  if (map is int) return map.toDouble();

  if (map is double) return map;

  return null;
}
