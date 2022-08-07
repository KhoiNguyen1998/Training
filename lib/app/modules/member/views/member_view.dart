import 'package:flutter/material.dart';
import 'package:flutter_getx_ttr/app/data/models/member.dart';
import 'package:flutter_getx_ttr/until/const/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/member_controller.dart';
import 'premiummemberview_view.dart';

class MemberView extends GetView<MemberController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  toolbarHeight: 82,
                  backgroundColor: headerColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(svg_back),
                      ),
                      SvgPicture.asset(svg_logo),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(svg_setting),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  color: searchBoxColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(svg_search),
                      ),
                      Text(
                        sortByConditions,
                        style: GoogleFonts.notoSans(
                            fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                TabBar(
                  controller: controller.tabController,
                  unselectedLabelColor: unSelectLabelColor,
                  labelColor: selectedLabelColor,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Row(
                          children: [
                            // SvgPicture.asset(svg_dis_Clock),
                            Obx(() {
                              return controller.isShowing.value
                                  ? SvgPicture.asset(svg_clock)
                                  : SvgPicture.asset(svg_dis_Clock);
                            }),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              showRecentlyLoggedUsers,
                              style: GoogleFonts.notoSans(
                                  fontSize: 10, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Obx(() {
                            return controller.isShowing.value
                                ? SvgPicture.asset(svg_monorchy)
                                : SvgPicture.asset(svg_monarchy_gold);
                          }),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            showUsersRank,
                            style: GoogleFonts.notoSans(
                                fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      Obx(() {
                        return controller.member.length != 0
                            ? gridMember(
                                controller.member, controller.fetchData())
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                      Obx(() {
                        return controller.member.length != 0
                            ? gridMember(
                                controller.member, controller.fetchData())
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundAppbarColor,
            selectedItemColor: textBottombarColor,
            unselectedItemColor: colorBottomIcon,
            unselectedLabelStyle: GoogleFonts.notoSans(
              textStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 6,
                fontWeight: FontWeight.w700,
              ),
            ),
            selectedLabelStyle: GoogleFonts.notoSans(
              textStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 6,
                fontWeight: FontWeight.w700,
              ),
            ),
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_account),
                label: myPage,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_speaker),
                label: userAnnouncement,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_event),
                label: eventCommunity,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_members),
                label: listMember,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(svg_message),
                label: message,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridMember(RxList listMember, refresh) {
    return RefreshIndicator(
      // controller: controller.refreshController,
      onRefresh: () => refresh,
      child: GridView.builder(
        controller: controller.scrollController,
        shrinkWrap: true,
        itemCount: listMember.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          childAspectRatio: 1.6,
          mainAxisSpacing: 16,
          mainAxisExtent: 175,
        ),
        itemBuilder: (context, index) {
          if (index < listMember.length) {
            Member item = listMember[index];
            return PremiumMember(item: item, index: index);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: const CircularProgressIndicator(),
              ),
            );
          }

          // if (index == controller.post.length) {
          //   return CircularProgressIndicator();
          // } else {
          //   return PremiumMember(item: item, index: index);
          // }

          // if (item.isPremium == true) {
          //   return PremiumMember(
          //     item: item,
          //     index: index,
          //   );
          // } else {
          //   return NormalMember(
          //     item: item,
          //   );
          // }
        },
      ),
    );
  }
}
