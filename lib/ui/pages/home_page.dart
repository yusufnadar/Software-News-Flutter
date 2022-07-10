import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:software_news/controller/news_controller.dart';
import 'package:software_news/core/constants/colors.dart';
import 'package:software_news/core/constants/fonts.dart';
import 'package:software_news/ui/pages/news_detail.dart';
import 'package:software_news/ui/pages/notifications.dart';
import 'package:software_news/ui/widgets/drawer.dart';
import 'package:software_news/ui/widgets/shimmer.dart';

class HomePageController extends GetxController {
  ScrollController scrollController = ScrollController();
  RxBool canRequest = true.obs;

  void _listeScrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (pageNumber <= 9) {
        if (canRequest.value == true) {
          canRequest.value = false;
          Get.find<NewsController>().isLoading.value = true;
          Get.find<NewsController>().getNews(page: pageNumber).then((value) {
            Get.find<NewsController>().isLoading.value = false;
            canRequest.value = true;
            if (value == true) {
              pageNumber++;
            }
          });
        }
      }
    }
  }

  int pageNumber = 2;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_listeScrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'Software News',
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const Notifications()),
            child: Image.asset(
              'assets/images/bell.png',
              color: primaryColor,
            ),
          )
        ],
      ),
      body: GetX<NewsController>(
        builder: (controller) {
          if (controller.newsList.isEmpty) {
            return ListView.builder(
              cacheExtent: 9999,
              padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.01,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => buildEachShimmer(
                controller,
                index,
              ),
            );
          } else {
            return SingleChildScrollView(
              controller: Get.find<HomePageController>().scrollController,
              child: Column(
                children: [
                  ListView.builder(
                    cacheExtent: 9999,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.01,
                    ),
                    itemCount: controller.newsList.length,
                    itemBuilder: (context, index) => buildEachNewsItem(
                      controller,
                      index,
                    ),
                  ),
                  controller.isLoading.value == true
                      ? Container(
                          margin: EdgeInsets.only(bottom: Get.height * 0.02),
                          child: Text(
                            'Loading...',
                            style: regularTextStyle(fontSize: 16),
                          ))
                      : Container()
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Container buildEachShimmer(NewsController controller, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: Get.width,
            height: Get.height * 0.22,
          ),
          SizedBox(height: Get.height * 0.015),
          ShimmerWidget(
            width: Get.width,
            height: Get.height * 0.02,
          ),
          SizedBox(height: Get.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerWidget(
                width: Get.width * 0.25,
                height: Get.height * 0.015,
              ),
              ShimmerWidget(
                width: Get.width * 0.25,
                height: Get.height * 0.015,
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildEachNewsItem(NewsController controller, int index) {
    return GestureDetector(
      onTap: () => Get.to(() => NewsDetail(),
          arguments: {'detailLink': controller.newsList[index].newsDetail}),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: Get.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                key: UniqueKey(),
                imageUrl: controller.newsList[index].image!,
                imageBuilder: (context, imageProvider) => Container(
                  height: Get.height * 0.2471,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                placeholderFadeInDuration: const Duration(seconds: 0),
                placeholder: (context, error) =>
                    ShimmerWidget(width: Get.width, height: Get.height * 0.22),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: Get.height * 0.015, bottom: Get.height * 0.01),
              child: Text(
                controller.newsList[index].title!,
                style: mediumTextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.newsList[index].author!,
                  style: regularTextStyle(
                      fontSize: 12, color: Colors.grey.shade500),
                ),
                Text(
                  DateFormat.yMMMd('tr')
                          .format(DateTime.parse(
                              controller.newsList[index].createdAt!))
                          .toString() +
                      ' ' +
                      DateFormat.Hm('tr').format(
                        DateTime.parse(
                          controller.newsList[index].createdAt!,
                        ),
                      ),
                  style: regularTextStyle(
                      fontSize: 12, color: Colors.grey.shade500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
