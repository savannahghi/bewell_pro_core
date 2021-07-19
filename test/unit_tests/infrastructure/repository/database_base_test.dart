import 'package:flutter_test/flutter_test.dart';
import 'package:bewell_pro_core/infrastructure/repository/database_base.dart';
import 'package:bewell_pro_core/infrastructure/repository/migrations.dart';

void main() {
  group('BeWellDatabaseBase', () {
    test('Tables enum returns correct values', () {
      expect(Tables.miscState.name, 'miscState');
      expect(Tables.userFeedState.name, 'userFeedState');
      expect(Tables.userState.name, 'userState');
      expect(Tables.clinicalState.name, 'clinicalState');
      expect(Tables.navigationState.name, 'navigationState');
    });

    test('migrations', () {
      expect(migrations, isA<List<String>>());
      expect(migrations.length, 5);
    });
  });
}
