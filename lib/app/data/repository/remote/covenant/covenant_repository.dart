import 'package:empresta/app/domain/entities/covenant_entity.dart';

import '../../../provider/remote/covenant/i_covenant_provider.dart';
import 'i_covenant_repository.dart';

class CovenantRepository implements ICovenantRepository {
  final ICovenantProvider provider;
  CovenantRepository({required this.provider});

  @override
  Future<List<CovenantEntity>?> getCovenants() {
    return provider.getCovenants();
  }
}
