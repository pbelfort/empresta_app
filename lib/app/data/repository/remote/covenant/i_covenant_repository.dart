import '../../../../domain/entities/covenant_entity.dart';

abstract class ICovenantRepository {
  Future<List<CovenantEntity>?> getCovenants();
}
