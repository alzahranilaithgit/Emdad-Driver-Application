// odoo_auth_service.dart
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooAuthService {
  final OdooClient _client;

  OdooAuthService(this._client);

  Future<bool> authenticate(String username, String password) async {
    try {
      await _client.authenticate('admin', username, password);
      return true;
    } catch (e) {
      print('Authentication failed: $e');
      return false;
    }
  }
}
