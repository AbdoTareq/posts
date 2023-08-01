import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/app/nav/post_details/views/post_details_view.dart';
import 'package:flutter_new_template/view/widgets/custom_app_bar.dart';

import '../../../../export.dart';

class FavoritesView extends GetView<FavoritesController> {
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await controller.onReady(),
      child: controller.obx(
        (state) => Scaffold(
          backgroundColor:
              Theme.of(context).textTheme.headlineSmall!.backgroundColor,
          drawer: AppDrawer(),
          appBar: CustomAppBar(
            title: favorites,
            searchList: controller.state,
            searchController: searchController,
          ),
          body: ListView.builder(
            itemCount: state!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: [
                    ListTile(
                      title: state[index].title.text.bold.xl.make(),
                      subtitle: '${state[index].body.substring(0, 100)} ...'
                          .text
                          .bold
                          .xl
                          .make(),
                      onTap: () => pushNewScreen(context,
                          screen: PostDetailsView(state[index])),
                    ).expand(),
                    IconButton(
                      onPressed: () async =>
                          await controller.removeFavorite(state[index]),
                      icon: Icon(Icons.favorite),
                    )
                  ],
                ),
              ).p4();
            },
          ).hFull(context),
        ),
        onLoading: ShimmerList(),
        onEmpty: no_data.tr.text.bold.xl.makeCentered(),
        onError: (error) => ListView(children: [
          (Get.height * .4).heightBox,
          error.toString().text.bold.xl.red500.makeCentered().px8()
        ]),
      ),
    );
  }
}
