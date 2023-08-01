import 'package:flutter_new_template/app/nav/post_details/views/post_details_view.dart';
import 'package:flutter_new_template/view/widgets/custom_app_bar.dart';

import '../../../../export.dart';
import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        backgroundColor:
            Theme.of(context).textTheme.headlineSmall!.backgroundColor,
        drawer: AppDrawer(),
        appBar: CustomAppBar(
          title: 'Posts',
          searchList: controller.state,
          searchController: searchController,
        ),
        body: ListView.builder(
          controller: controller.scrollController,
          itemCount: state!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: state[index].title.text.bold.xl.make(),
                subtitle: '${state[index].body.substring(0, 100)} ...'
                    .text
                    .bold
                    .xl
                    .make(),
                onTap: () => pushNewScreen(context,
                    screen: PostDetailsView(state[index])),
              ),
            ).p4();
          },
        ).hFull(context),
      ),
      onLoading: ShimmerList(),
      onEmpty: Container(),
      onError: (error) => error.toString().text.bold.xl.red500.makeCentered(),
    );
  }
}
