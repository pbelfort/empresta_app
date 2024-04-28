import 'package:empresta/app/domain/entities/covenant_entity.dart';
import 'package:empresta/app/domain/entities/institution_entity.dart';

class InstitutionModel extends InstitutionEntity {
  InstitutionModel({
    required super.key,
    required super.value,
  });

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
      };

  factory InstitutionModel.fromEntity(CovenantEntity entity) {
    return InstitutionModel(
      key: entity.key,
      value: entity.value,
    );
  }

  factory InstitutionModel.fromMap(Map<String, dynamic> map) {
    return InstitutionModel(
      key: map['chave'],
      value: map['valor'],
    );
  }
}
