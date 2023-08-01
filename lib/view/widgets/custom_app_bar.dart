import 'package:flutter_new_template/models/post.dart';

import '../../app/nav/post_details/views/post_details_view.dart';
import '../../export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.searchList,
    required this.searchController,
  }) : super(key: key);

  final SearchController searchController;
  final String title;
  final List<Post>? searchList;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title.tr.text.xl.bold.make(), actions: [
      searchList == null
          ? Container()
          : SearchAnchor(
              searchController: searchController,
              builder: (context, SearchController searchController) =>
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        searchController.openView();
                      }),
              viewHintText: 'Start typing to filter',
              suggestionsBuilder:
                  (context, SearchController searchController) => searchList!
                      .where((element) =>
                          element.title.contains(searchController.text))
                      .map((e) => ListTile(
                          title: e.title.text.bold.xl.make(),
                          onTap: () {
                            pushNewScreen(context, screen: PostDetailsView(e));
                            searchController.closeView(e.title);
                          })),
            )
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
