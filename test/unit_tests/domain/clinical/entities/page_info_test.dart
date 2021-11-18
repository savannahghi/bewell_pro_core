// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:bewell_pro_core/domain/clinical/entities/page_info.dart';

void main() {
  test('PageInfo should create a valid object', () {
    final PageInfo _pageInfo = PageInfo(
      hasNextPage: true,
      hasPreviousPage: true,
      startCursor: 'Start cursor',
      endCursor: 'end cursor',
    );

    final Map<String, dynamic> pageInfoObject = _pageInfo.toJson();
    expect(pageInfoObject.containsKey('hasNextPage'), true);
    expect(pageInfoObject.containsKey('hasPreviousPage'), true);
    expect(pageInfoObject.containsKey('startCursor'), true);
    expect(pageInfoObject.containsKey('endCursor'), true);

    final Map<String, dynamic> _pageInfoData = <String, dynamic>{
      'hasNextPage': true,
      'hasPreviousPage': true,
      'startCursor': 'start',
      'endCursor': 'end',
    };

    final PageInfo _serializedPageInfo = PageInfo.fromJson(_pageInfoData);
    expect(_serializedPageInfo.hasNextPage, true);
    expect(_serializedPageInfo.hasPreviousPage, true);
    expect(_serializedPageInfo.startCursor, 'start');
    expect(_serializedPageInfo.endCursor, 'end');
  });
}
