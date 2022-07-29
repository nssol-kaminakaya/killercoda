### Serviceへ監視コードを埋め込む

- 作業概要
    - Controller 同様に Service にも監視コードを埋め込む
    - 対象は selectMany メソッド
- 作業手順
    - Editorで下記ファイルを開く
        - `otel-demo/demo/src/main/java/com/example/demo/domain/servie/UserService.java`
    - Controller と同様に監視コードを埋め込む

    ```java
    // file: otel-demo/demo/src/main/java/com/example/demo/domain/servie/UserService.java

    // import文追加
    import io.opentelemetry.api.OpenTelemetry;
    import io.opentelemetry.api.trace.Span;
    import io.opentelemetry.api.trace.Tracer;
    import io.opentelemetry.context.Scope;

    @Service
    public class UserService {

        // インスタンスを自動インジェクションする
        @Autowired
        private OpenTelemetry openTelemetry;

        // 省略

        // Controller同様にselectManyを書き換える
        public List<User> selectMany() throws DataAccessException {
            Tracer tracer = openTelemetry.getTracer("io.opentelemetry.api", "1.11.0");
            Span span = tracer.spanBuilder("userServiceSelectMany").startSpan();

            span.setAttribute("SQL", "select * from user");

            try (Scope scope = span.makeCurrent()) {

                return userMapper.selectMany();

            } finally {
                span.end();
            }
        }

        // 省略

    }
    ```