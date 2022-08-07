// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/models/member.dart';
import 'package:flutter_getx_ttr/app/data/repositories/repositories.dart';
import 'package:get/get.dart';

class MemberController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isShowing = true.obs;
  final member = <Member>[].obs;
  final page = 0.obs;
  final scrollController = ScrollController();
  late TabController tabController;

  @override
  void onInit() async {
    await fetchData();
    tabController = TabController(length: 2, vsync: this);
    scrollController.addListener(() {
      // if (scrollController.position.maxScrollExtent ==
      //     scrollController.offset) {
      //   getMember();
      // } else {}
    });
    swipeContrller();
    super.onInit();

    // addNormalMEmber();
    // addPremiumMember();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    // scrollController.removeListener(() {
    //   loadMore();
    // });
    super.onClose();
  }

  Future<void> fetchData() async {
    Repositories.member.fetchDataMember();
    Repositories.member.fetchMemberWithLimit(page: page.value);
  }

  // addNormalMEmber() async {
  //   var list = await UserProvider().fetchNormalMember();
  //   listNormalMember.assignAll(list!);
  // }

  // addPremiumMember() async {
  //   var list = await UserProvider().fetchPremiumMember();
  //   listPremiumMember.assignAll(list!);
  // }

  // getMember() async {
  //   try {
  //     var listData = await MemberProvider().fetchUserWithLimit();
  //     member.assignAll(listData!);
  //     print(listData);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Something went wrong');
  //     }
  //   }
  // }

  // loadMore() async {
  //   if (isHaveNextPage.value == true &&
  //       isFirstLoadRunning.value == false &&
  //       isLoadMoreRunning.value == false &&
  //       scrollController.position.extentAfter < 300) {
  //     isLoadMoreRunning.value = false;
  //     page.value += 1;
  //     try {
  //       final res = await UserProvider().fetchUserWithLimit(page: page.value);
  //       if (res!.isNotEmpty) {
  //         post.addAll(res);
  //       } else {
  //         isHaveNextPage.value = false;
  //       }
  //     } catch (e) {
  //       if (kDebugMode) {
  //         print('Somethign went wrong');
  //       }
  //     }
  //   } else {}
  // }

  swipeContrller() {
    tabController.addListener(() {
      switch (tabController.index) {
        case 0:
          isShowing.value = true;
          print(tabController.index.toString());
          break;
        case 1:
          isShowing.value = false;
          print(tabController.index.toString());

          break;
        default:
      }
    });
  }
}
