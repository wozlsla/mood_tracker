import 'package:flutter/cupertino.dart';
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
                      GestureDetector(
                        onLongPress: () {
                          showCupertinoDialog(
                            context: context,
                            builder:
                                (context) => CupertinoAlertDialog(
                                  title: Text("Delete"),
                                  actions: [
                                    CupertinoDialogAction(
                                      onPressed: () => Navigator.pop(context),
                                      isDefaultAction: true,
                                      child: const Text("Cancle"),
                                    ),
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        ref
                                            .read(postProvider.notifier)
                                            .deletePost(data[index].postId);
                                        Navigator.pop(context);
                                      },
                                      isDestructiveAction: true,
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 100,
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(data[index].emotion.icon),
                              Text(
                                data[index].body,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
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
