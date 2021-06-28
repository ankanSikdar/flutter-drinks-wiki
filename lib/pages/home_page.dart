import 'package:drinks_wiki/widgets/category_grid_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 32.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: CategoryGridView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
