import 'package:empresta/app/domain/entities/institution_entity.dart';
import '../../../provider/remote/institution/i_institution_provider.dart';
import 'i_institution_repository.dart';

class InstitutionRepository implements IInstitutionRepository {
  final IInstitutionProvider provider;
  InstitutionRepository({required this.provider});

  @override
  Future<List<InstitutionEntity>?> getInstitutions() {
    return provider.getInstitutions();
  }
}
