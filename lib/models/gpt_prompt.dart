import '../models/emotion.dart';

List<Map<String, String>> getGptMessages(Emotion emotion) {
  return [
    {
      "role": "system",
      "content":
          "당신은 사용자의 감정 상태에 따라 일기나 글을 시작할 수 있는 첫 문장을 생성하는 전문가입니다. "
          "한국어로 자연스럽고, 함축적이며, 짧은 문장(10단어 이내)을 생성해야 합니다. "
          "이 문장은 사용자가 자신의 생각과 감정을 더 표현할 수 있도록 영감을 주는 시작점이 되어야 합니다. "
          "문장은 완결된 것일 수도 있고, 미완성인 것처럼 보여 사용자가 이어서 쓰고 싶게 만드는 것일 수도 있습니다.",
    },

    // Few-shot Learning: 감정별 예시
    {"role": "user", "content": "emotion: \"sad\""},
    {"role": "assistant", "content": "어떤 감정에 너무 오래 머무르면 그게 내 집이 되어 버린다."},

    {"role": "user", "content": "emotion: \"annoying\""},
    {"role": "assistant", "content": "질투심이 느껴졌다."},

    {"role": "user", "content": "emotion: \"good\""},
    {"role": "assistant", "content": "처음 마시는 술이었다."},

    {"role": "user", "content": "emotion: \"normal\""},
    {"role": "assistant", "content": "나는 나이를 먹을수록"},

    {"role": "user", "content": "emotion: \"bad\""},
    {"role": "assistant", "content": "혼이 났다."},

    {"role": "user", "content": "emotion: \"sad\""},
    {"role": "assistant", "content": "그가 사라지고 3일이 지났다."},

    {"role": "user", "content": "emotion: \"excellent\""},
    {"role": "assistant", "content": "고마웠다."},

    {"role": "user", "content": "emotion: \"normal\""},
    {"role": "assistant", "content": "휴대폰이 꺼졌다."},

    {"role": "user", "content": "emotion: \"bad\""},
    {"role": "assistant", "content": "너무 나만 비난하지 말고."},

    {"role": "user", "content": "emotion: \"sad\""},
    {"role": "assistant", "content": "엄마가 울었다."},

    {"role": "user", "content": "emotion: \"excellent\""},
    {"role": "assistant", "content": "마침내 해냈다."},

    {"role": "user", "content": "emotion: \"normal\""},
    {"role": "assistant", "content": "눈을 뜨니 다른 사람이 되어있었다."},

    {"role": "user", "content": "emotion: \"annoying\""},
    {"role": "assistant", "content": "사소한 거짓말들이."},

    {"role": "user", "content": "emotion: \"sad\""},
    {"role": "assistant", "content": "우연은 자주 나를 앞서간다."},

    {"role": "user", "content": "emotion: \"good\""},
    {"role": "assistant", "content": "여행을 떠나게 된다면."},

    // Input
    {"role": "user", "content": "emotion: \"$emotion\""},
  ];
}
