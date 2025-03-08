import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/view_models/post_vm.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "2025.03",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: ref
          .watch(postProvider)
          .when(
            data: (data) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(data[index].body),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: data.length,
              );
            },
            error: (e, s) {
              return Center(child: Text("error: ${e.toString()}"));
            },
            loading: () => Center(child: CircularProgressIndicator.adaptive()),
          ),
    );
  }
}
