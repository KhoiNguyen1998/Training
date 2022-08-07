library repositories;

import '../models/member.dart';
import '../provider/providers.dart';

part 'member_repository.dart';

class Repositories {
  static MemberRepository get member => MemberRepository();
}
