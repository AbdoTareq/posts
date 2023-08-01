import 'package:flutter_new_template/app/nav/post_details/views/post_details_view.dart';

import '../../../../export.dart';
import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Posts')),
      body: controller
          .obx(
            (state) => ListView.builder(
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
                    onTap: () =>
                        pushNewScreen(context, screen: PostDetailsView()),
                  ),
                ).p4();
              },
            ),
            onLoading: ShimmerList(),
            onError: (error) =>
                error.toString().text.bold.xl.red500.makeCentered(),
          )
          .p8(),
    );
  }
}
