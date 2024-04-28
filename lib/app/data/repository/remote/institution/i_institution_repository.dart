import '../../../../domain/entities/institution_entity.dart';

abstract class IInstitutionRepository {
  Future<List<InstitutionEntity>?> getInstitutions();
}
