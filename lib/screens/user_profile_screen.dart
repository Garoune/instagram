import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 50,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18, top: 18),
                    child: Icon(Icons.menu),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                        color: Color(0xff1C1F2E),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                ),
                backgroundColor: Color(0xff1C1F2E),
                expandedHeight: 170,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorPadding: EdgeInsets.only(bottom: 4),
                    indicatorWeight: 2,
                    indicatorColor: Color(0xffF35383),
                    tabs: [
                      Tab(
                        icon: Image.asset('images/images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20,left: 18,right: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/item$index.png')),
                            ),
                          );
                        },
                        childCount: 15,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20,left: 18,right: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Image.asset('images/item$index.png')),
                            ),
                          );
                        },
                        childCount: 15,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Color(0xffF35383)),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'گارونه گرجیان',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Garounehh',
                    style: TextStyle(
                        fontFamily: 'GB',
                        color: Color(0xffC5C5C5),
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
