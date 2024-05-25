import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/components/new_item.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Tin Tức'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            NewItemWidget(
              
              image: "assets/images/new1.png",
              description: "Researchers produce advanced",
              title: "Não bộ",
            ),
            SizedBox(height: 20),
            NewItemWidget(
              image: "assets/images/new2.png",
              description: "Two analytical methods developed",
              title: "Rau quả",
            ),
            SizedBox(height: 20),
            NewItemWidget(
              image: "assets/images/new3.png",
              description: "Revolutionizing neurological research",
              title: "Thần kinh",
            ),
            SizedBox(height: 20),
            NewItemWidget(
              image: "assets/images/new4.png",
              description: "Immunotherapy-chemotherapy combo",
              title: "ADN",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      endDrawer: const AppDrawer(currentPage: 'NewPage'),
    );
  }
}
