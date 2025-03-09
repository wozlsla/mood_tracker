import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/view_models/post_vm.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 42.0),
        child: Scaffold(
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
                                          onPressed:
                                              () => Navigator.pop(context),
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
                              constraints: BoxConstraints(
                                minHeight: 70.0,
                              ), // 최소 높이 설정
                              padding: const EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    data[index].emotion.icon,
                                    color: data[index].emotion.tintColor
                                        .withValues(alpha: 0.7),
                                    size: 18.0,
                                  ),
                                  Gaps.v5,
                                  Text(
                                    data[index].body,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    data[index].timeAgo,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey.shade500,
                                    ),
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
                loading:
                    () => Center(child: CircularProgressIndicator.adaptive()),
              ),
        ),
      ),
    );
  }
}
