import 'dart:convert';
import 'package:empresta/app/data/model/covenant_model.dart';
import 'package:empresta/app/data/model/institution_model.dart';
import 'package:empresta/app/data/model/simulation_model.dart';
import 'package:empresta/app/domain/entities/covenant_entity.dart';
import 'package:empresta/app/domain/entities/institution_entity.dart';
import 'package:empresta/app/domain/entities/simulation_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';
import 'adapter/http/http_mock_adapter.dart';
import 'adapter/nock/nock_mock_adapter.dart';
import 'mock_variables_test.dart';

void main() {
  setUpAll(nock.init);

  setUp(() {
    nock.cleanAll();
  });

  test(
    'Testing get institutions',
    () async {
      final interceptor = NockMockAdapter.nockGetInterceptor(
        path: '/instituicao',
        body: mockInstitutions,
      );

      final response = await HttpMockAdapter.httpGet("/instituicao");

      final institutionList = (json.decode((response.body)) as List)
          .map((e) => InstitutionModel.fromMap(e))
          .cast<InstitutionEntity>()
          .toList();

      final containsPan =
          institutionList.any((covenant) => covenant.key == "PAN");
      final containsOle =
          institutionList.any((covenant) => covenant.key == "OLE");
      final containsBmg =
          institutionList.any((covenant) => covenant.key == "BMG");

      expect(interceptor.isDone, true);
      expect(response.statusCode, 200);
      expect(institutionList.length, 3);
      expect(
        containsPan && containsOle && containsBmg,
        isTrue,
      );
    },
  );

  test(
    'Testing get covenants',
    () async {
      final interceptor = NockMockAdapter.nockGetInterceptor(
        path: '/convenio',
        body: mockCovenants,
      );

      final response = await HttpMockAdapter.httpGet("/convenio");

      final covenantList = (json.decode((response.body)) as List)
          .map((e) => CovenantModel.fromMap(e))
          .cast<CovenantEntity>()
          .toList();

      final containsInss =
          covenantList.any((covenant) => covenant.key == "INSS");
      final containsFederal =
          covenantList.any((covenant) => covenant.key == "FEDERAL");
      final containsSiape =
          covenantList.any((covenant) => covenant.key == "SIAPE");

      expect(interceptor.isDone, true);
      expect(response.statusCode, 200);
      expect(covenantList.length, 3);
      expect(
        containsInss && containsFederal && containsSiape,
        isTrue,
      );
    },
  );

  test('Testing simulation', () async {
    final List<SimulationEntity> simulationList = [];
    final interceptor = NockMockAdapter.nockPostInterceptor(
      path: '/simular',
      body: mockSimulation,
    );

    final response = await HttpMockAdapter.httpPost('/simular');

    final decodedResponseList =
        json.decode((response.body)) as Map<String, dynamic>;

    decodedResponseList.forEach((key, value) {
      if (value is List) {
        simulationList.add(
          SimulationModel.fromJson(
            key,
            value,
          ),
        );
      }
      if (value is Map) {
        for (var e in value.entries) {
          simulationList.add(
            SimulationModel.fromJson(
              key,
              e,
            ),
          );
        }
      }
    });
    expect(interceptor.isDone, true);
    expect(response.statusCode, 200);
    expect(simulationList.length, 3);
    expect(simulationList.isNotEmpty, isTrue);
  });
}
