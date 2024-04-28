import '../../../../domain/entities/institution_entity.dart';

abstract class IInstitutionProvider {
  Future<List<InstitutionEntity>?> getInstitutions();
}
