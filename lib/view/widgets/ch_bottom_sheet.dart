import '../../export.dart';

class ChBottomSheet extends StatelessWidget {
  const ChBottomSheet({
    Key? key,
    required this.title,
    required this.choices,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final List<String> choices;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title.tr,
              style: Theme.of(context).textTheme.headline5,
            ),
            Expanded(
              child: choices.isEmpty
                  ? Center(child: Text(no_data.tr))
                  : ListView.builder(
                      itemCount: choices.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            onTap(index);
                            Get.back();
                          },
                          title: Text(choices[index].tr),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    ).cornerRadius(10);
  }
}
