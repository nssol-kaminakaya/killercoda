### Controllerの監視コードを修正する

- 作業概要
    - Span情報を子メソッドへ伝搬するように監視コードを修正する
- 作業手順
    - Editorで下記ファイルを開く
        - `otel-demo/demo/src/main/java/com/example/demo/controller/HomeController.java`
    - HomeController.java を下記のように修正
        - import 文を新しく追加
        - try 構文の中に新しくScopeを定義する

    ```java
    // file: otel-demo/demo/src/main/java/com/example/demo/controller/HomeController.java

    // 前半で追加済み
    import io.opentelemetry.api.OpenTelemetry;
    import io.opentelemetry.api.trace.Span;
    import io.opentelemetry.api.trace.Tracer;

    // 新しく追加
    import io.opentelemetry.context.Scope;

    @Controller
    public class HomeController {

        // 前半で追加済み
        @Autowired
        private OpenTelemetry openTelemetry; // ポイント1

        // 省略

        @GetMapping("/userList")
        public String getUserList(Model model) {
            Tracer tracer = openTelemetry.getTracer("io.opentelemetry.api", "1.11.0");
            Span span = tracer.spanBuilder("getUserList").startSpan();

            span.setAttribute("http.method", "GET");
            span.setAttribute("http.url", "/userList");

            // ポイント1
            try (Scope scope = span.makeCurrent()) {

                model.addAttribute("contents", "login/userList::userList_contents");

                // ポイント2
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
    - ポイント 1：Scope の導入
        - Scope に現在の Span を登録する。
        - Scopeに格納されたSpanのIDが連携してChild Spanと紐づけされる
    - ポイント 2：サービスの呼び出し
        - ここで呼び出すサービスのメソッドに監視コードを埋め込む
