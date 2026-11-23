import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zen_bahcesi_bonsai/oyun_zen_bahcesi_bonsai.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zenBahcesiConfig.title.length, 33);
    expect(zenBahcesiConfig.tagline.length, 33);
    for (final s in zenBahcesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(zenBahcesiConfig.gameId, zenBahcesiId);
    expect(zenBahcesiRules.gameId, zenBahcesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(zenBahcesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: zenBahcesiId, optionalMechanics: zenBahcesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zenBahcesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
