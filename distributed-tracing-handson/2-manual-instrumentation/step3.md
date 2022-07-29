## Controller層へ監視コードを埋め込む

- 作業概要
  - ユーザ一覧画面へ遷移するメソッドに監視コードを埋め込む
- 作業手順
  - HomeController.java に下記を追加
    - import 文を3行追加
    - Tracer や Span を定義する
    - Span を取得したい部分を try 構文で挟む。

```java
// file: otel-demo/demo/src/main/java/com/example/demo/controller/HomeController.java

// 課題1で追加済み
import io.opentelemetry.api.OpenTelemetry;
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.api.trace.Tracer;

@Controller
public class HomeController {

  // 2行追加
  @Autowired
  private OpenTelemetry openTelemetry; // ポイント1

  // 省略

  // getUserListを下記に書き換える
  @GetMapping("/userList")
  public String getUserList(Model model) {
    Tracer tracer = openTelemetry.getTracer("io.opentelemetry.api", "1.11.0"); // ポイント2
    Span span = tracer.spanBuilder("getUserList").startSpan(); // ポイント3

    // ポイント4
    span.setAttribute("http.method", "GET");
    span.setAttribute("http.url", "/userList");

    // ポイント5
    try {

      model.addAttribute("contents", "login/userList::userList_contents");

      List<User> userList = userService.selectMany();

      model.addAttribute("userList", userList);

      int count = userService.count();
      model.addAttribute("userListCount", count);

      return "login/homeLayout";

    } finally {
      span.end();
    }
  }

  //省略

}
```

- 補足
  - ポイント 1：Autowired
    - @Autowired を使って OpenTelemetry インスタンスを自動インジェクションする。
  - ポイント 2：Tracer の設定
    - Tracer は Span の生成や Context との連携を担う。
    - getTracer の引数には計装で使用したライブラリを指定する。
    - オプションとしてバージョンを設定できる。
  - ポイント 3：Span 取得開始
    - startSpan で Span の取得を開始する。
    - spanBuilder で Span 名を設定している。
  - ポイント 4：Span に属性付与
    - setAttribute(key, value)で Span に必要な属性値を付与する。
  - ポイント 5：Span 取得終了
    - 実際に取得する記述を try 構文に書く。
    - finally の中で span.end をすることで Span の取得を停止する。