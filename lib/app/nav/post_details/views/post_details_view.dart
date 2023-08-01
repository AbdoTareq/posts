import 'package:flutter_new_template/export.dart';
import 'package:flutter_new_template/models/post.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;

  PostDetailsView(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Details')),
      backgroundColor:
          Theme.of(context).textTheme.headlineSmall!.backgroundColor,
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: post.title.text.bold.xl3.make(),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'User id: ${post.userId}'.tr.text.bold.xl.make(),
                  post.body.text.bold.xl2.make(),
                ],
              ),
            ),
          ).p2(),
        ],
      ),
    );
  }
}
