part of 'repositories';

abstract class MemberBase {
  Future<List<Member>?> fetchDataMember();
  Future<List<Member>?> fetchMemberWithLimit({required int page});
}

class MemberRepository implements MemberBase {
  @override
  Future<List<Member>?> fetchDataMember() => MemberProvider.fetchDataMember();

  @override
  Future<List<Member>?> fetchMemberWithLimit({required int page}) =>
      MemberProvider.fetchMemberWithLimit(page);
}
