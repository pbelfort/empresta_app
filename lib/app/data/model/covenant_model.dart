import 'package:empresta/app/domain/entities/covenant_entity.dart';

class CovenantModel extends CovenantEntity {
  CovenantModel({
    required super.key,
    required super.value,
  });

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
      };

  factory CovenantModel.fromEntity(CovenantEntity entity) {
    return CovenantModel(
      key: entity.key,
      value: entity.value,
    );
  }

  factory CovenantModel.fromMap(Map<String, dynamic> map) {
    return CovenantModel(
      key: map['chave'],
      value: map['valor'],
    );
  }
}
