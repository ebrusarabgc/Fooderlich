import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();
  
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipes: snapshot.data?.todayRecipes ?? [],
              ),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              ),
            ],
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
