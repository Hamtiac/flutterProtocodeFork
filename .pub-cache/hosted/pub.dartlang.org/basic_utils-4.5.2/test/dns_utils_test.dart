import 'package:basic_utils/basic_utils.dart';
import 'package:test/test.dart';

void main() {
  test('Test lookupRecord', () async {
    var records = await DnsUtils.lookupRecord('google.de', RRecordType.A);
    expect(records?.elementAt(0).data.isEmpty, false);
    expect(records?.elementAt(0).rType, 1);
  });

  test('Test lookupRecord Cloudflare', () async {
    var records = await DnsUtils.lookupRecord('google.de', RRecordType.A,
        provider: DnsApiProvider.CLOUDFLARE);
    expect(records?.elementAt(0).data.isEmpty, false);
    expect(records?.elementAt(0).rType, 1);
  });

  test('Test reverseDns', () async {
    var records = await DnsUtils.reverseDns('172.217.22.14');
    expect(records!.elementAt(0).data.isEmpty, false);
    expect(records.elementAt(0).rType, 12);
  });

  test('Test getReverseAddr', () async {
    var reversed = DnsUtils.getReverseAddr('172.217.22.14');
    expect(reversed, '14.22.217.172.in-addr.arpa');

    reversed = DnsUtils.getReverseAddr('2a00:1450:4001:81a::200e');
    expect(reversed, 'e.0.0.2.a.1.8.1.0.0.4.0.5.4.1.0.0.a.2.ip6.arpa');

    reversed = DnsUtils.getReverseAddr('12345');
    expect(reversed, null);
  });

  test('Test toBind', () async {
    var r =
        RRecord(name: 'foo.bar.de.', rType: 16, ttl: 300, data: 'helloWorld');
    var bind = DnsUtils.toBind(r);
    expect(bind, 'foo.bar.de.\t\t300\tIN\tTXT\t\"helloWorld\"');
  });
}
