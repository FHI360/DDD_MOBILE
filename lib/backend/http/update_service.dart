import 'package:pub_semver/pub_semver.dart';

import 'api.dart';

class UpdateService {
  Future<bool> updateAvailable(String currentVersion) async {
    try {
      final response = await api.get(
          'https://drive.google.com/uc?export=download&id=1JKzE-AGC1KcVoDuTXdXgcQbZdBFTIQw4');
      final data = response.data as String;
      final current = Version.parse(currentVersion);
      final available = Version.parse(data.trim());
      return available.compareTo(current) > 0;
    } catch (ex) {
      return false;
    }
  }
}
