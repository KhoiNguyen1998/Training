library providers;

import '../helpers/api_helpers.dart';
import '../models/member.dart';

part 'member_provider.dart';

class Providers {
  static MemberProvider get member => MemberProvider();
}
