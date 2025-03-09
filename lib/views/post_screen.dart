import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/gaps.dart';
import 'package:mood_tracker/repos/gpt_repo.dart';
import 'package:mood_tracker/utils.dart';
import 'package:mood_tracker/view_models/post_vm.dart';
import 'package:mood_tracker/models/emotion.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final TextEditingController _textController = TextEditingController();
  String _text = "";
  Emotion _selectedEmotion = Emotion.normal; // 기본 감정

  void _onPostTap(WidgetRef ref) async {
    if (_text.isNotEmpty) {
      await ref
          .read(postProvider.notifier)
          .uploadPost(body: _text, emotion: _selectedEmotion);
    }
    if (mounted) {
      context.pop();
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _text = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
        appBar: AppBar(
          title: Text(
            "New post",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () async {
                  final GptRepository gptRepo = GptRepository();

                  try {
                    String sentence = await gptRepo.getSentence(
                      _selectedEmotion,
                    );
                    setState(() {
                      _textController.text = sentence;
                    });
                  } catch (e) {
                    print("문장 추천 실패: $e");
                  }
                },
                icon: FaIcon(FontAwesomeIcons.paintbrush),
              ),
            ),
          ],
          backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              height: 0.2,
              thickness: 0.2,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 8.0, right: 20.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "username",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _textController,
                      autocorrect: false,
                      maxLines: null, // 자동 줄바꿈 활성화
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "What's happening?",
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    Gaps.v10,
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Wrap(
                            spacing: 12.0,
                            children:
                                Emotion.values
                                    .map(
                                      (emotion) => GestureDetector(
                                        onTap:
                                            () => setState(() {
                                              _selectedEmotion = emotion;
                                            }),
                                        child: Icon(
                                          emotion.icon,
                                          color:
                                              _selectedEmotion == emotion
                                                  ? emotion.tintColor
                                                  : Colors.grey.shade400,
                                          size: 28.0,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Everyone can reply", style: TextStyle(fontSize: 14)),
              TextButton(
                onPressed: () => _onPostTap(ref),
                child:
                // ref.watch(postProvider).isLoading
                //     ? CircularProgressIndicator.adaptive() :
                Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        _textController.text.isEmpty
                            ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.6)
                            : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
