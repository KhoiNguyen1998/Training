part of 'providers';

abstract class MemberBase {
  Future<List<Member>?> fetchDataMember();
  Future<List<Member>?> fetchMemberWithLimit();
}

class MemberProvider {
  MemberProvider._();
  static final MemberProvider _instance = MemberProvider._();
  factory MemberProvider() => _instance;
  static int limit = 10;

  static Future<List<Member>?> fetchDataMember() async {
    try {
      final res = await ApiHelper.request('/members');
      return (res.data ?? []).map((json) => Member.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Member>?> fetchMemberWithLimit(int page) async {
    try {
      final res =
          await ApiHelper.request('/members?page=${page}_limit=${limit}');
      return (res.data ?? []).map((json) => Member.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
  // final String url = 'https://agrichapp.herokuapp.com/members';
  // Dio dio = Dio();
  // final int limit = 10;

  // Future<List<User>?> fetchDataMember() async {
  //   try {
  //     final res = await dio.get(url);
  //     if (res.statusCode == 200) {
  //       var getUserData = res.data as List;
  //       var listPremiumUser = getUserData.map((e) => User.fromJson(e)).toList();
  //       return listPremiumUser;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List<User>?> fetchNormalMember() async {
  //   try {
  //     final res = await dio.get(url, queryParameters: {'isPremium': false});
  //     if (res.statusCode == 200) {
  //       var getUserData = res.data as List;
  //       var listUserNormal = getUserData.map((e) => User.fromJson(e)).toList();
  //       return listUserNormal;
  //     } else {
  //       throw Exception("Failed to load user");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List<User>?> fetchUserWithLimit({int page = 0}) async {
  //   final res = await dio.get('$url?page=$page&_limit=$limit');
  //   try {
  //     if (res.statusCode == 200) {
  //       List getMemeber = res.data;
  //       List<User> _user = getMemeber.map((e) => User.fromJson(e)).toList();
  //       return _user;
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
