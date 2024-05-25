import 'package:flutter/material.dart';

class NewItemWidget extends StatelessWidget {
  const NewItemWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3), // Border width
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title != "" ? title : "Tin tức 1 ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description != ""
                    ? description
                    : "Global stocks retreated, erasing gains for the week as a glum s",
                overflow: TextOverflow.ellipsis,
              ),
              Text("boosts survival for patients with metastatic "),
            ],
          ),
        )
      ],
    );
  }
}
