import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Crops extends StatelessWidget {
  final cropsModel;
  Crops({@required this.cropsModel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: cropsModel.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CachedNetworkImage(imageUrl: cropsModel[index].photo)
                ),
                Container(
                  width: size.width * .15,
                  child: Text(
                    cropsModel[index].commodityName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                )
              ],
            ));
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 10 / 4,
      ),
    );
  }
}
