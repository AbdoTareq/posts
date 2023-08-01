import 'package:flutter_new_template/app/nav/post_details/views/post_details_view.dart';

import '../../../../export.dart';
import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  final SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Posts'), actions: [
        SearchAnchor(
          searchController: searchController,
          builder: (context, SearchController searchController) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                searchController.openView();
              }),
          viewHintText: 'Start typing to filter',
          suggestionsBuilder: (context, SearchController searchController) =>
              controller.state!
                  .where((element) =>
                      element.title.contains(searchController.text))
                  .map((e) => ListTile(
                      title: Text(e.title),
                      onTap: () {
                        searchController.closeView(e.title);
                      })),
        )
      ]),
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
                    onTap: () => pushNewScreen(context,
                        screen: PostDetailsView(state[index])),
                  ),
                ).p4();
              },
            ),
            onLoading: ShimmerList(),
            onEmpty: Container(),
            onError: (error) =>
                error.toString().text.bold.xl.red500.makeCentered(),
          )
          .p8(),
    );
  }
}
