import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_instagram/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        centerTitle: false,
        title: Container(
          width: 150,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.5,
                          minChildSize: 0.2,
                          maxChildSize: 0.7,
                          builder: (BuildContext context,
                              ScrollController controller) {
                            return ShareBottomSheet(controller: controller);
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'open bottemsheet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getSotryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      _getHeaderPost(),
                      SizedBox(
                        height: 24,
                      ),
                      _getPostContent()
                    ],
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSotryList() {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddSotryBox() : _getStoryListBox();
          }),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 34,
            ),
            _getHeaderPost(),
            SizedBox(
              height: 24,
            ),
            _getPostContent(),
          ],
        );
      },
    );
  }

  Widget _getPostContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 350,
                  width: 350,
                  child: Image.asset('images/post_cover.png'),
                ) // Added .png extension
                ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(width: 6),
                          Text(
                            '2.5 k',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6),
                          Text(
                            '1.5 k',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                            'images/icon_share_bottomsheet.png'), // Use Flexible to adjust layout
                      ),
                      SizedBox(width: 40),
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                            'images/icon_save.png'), // Use Flexible to adjust layout
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Garouneh',
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.white, fontSize: 12),
                ),
                Text(
                  'برنامه نویس فلاتر',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      dashPattern: [30, 10],
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(
              2.0), // Padding to create the inside border effect
          child: Container(
            height: 38,
            width: 38,
            child: Image.asset('images/profile.png'),
          ),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            dashPattern: [40, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(
                    2.0), // Padding to create the inside border effect
                child: Container(
                  height: 52,
                  width: 52,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'data',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getAddSotryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'your story',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
