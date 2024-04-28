import 'package:empresta/app/domain/entities/covenant_entity.dart';

abstract class ICovenantProvider {
  Future<List<CovenantEntity>?> getCovenants();
}
