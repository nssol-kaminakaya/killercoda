## OpenTelemetryインスタンスの生成

- 作業概要
  - Trace を取得するためには、SDK を用いてグローバルに 1 つだけの OpenTelemetry インスタンスを生成する必要がある。
    - このインスタンスによって Tracer を生成することができる。
  - メインクラスの中に OpenTelemery インスタンスを生成する。
- 作業手順
  - Editorで下記ファイルを開く。
    - `otel-demo/demo/src/main/java/com/example/demo/DemoApplication.java`
  - DemoApplication.java の中に 下記のように修正して保存する。
    - import 文 3 行追加
    - initOpentelemetry メソッドを追加

  ```java
  // file: otel-demo/demo/src/main/java/com/example/demo/DemoApplication.java

  // import文を3行追加
  import org.springframework.context.annotation.Bean;
  import io.opentelemetry.api.OpenTelemetry;
  import io.opentelemetry.sdk.autoconfigure.AutoConfiguredOpenTelemetrySdk;

  @SpringBootApplication
  public class DempApplication {

    public static void main(String[] args) {
      SpringApplication.run(DemoApplication.class, args);
    }

    // 下記を追記
    @Bean
    public static OpenTelemetry initOpenTelemetry() {
      OpenTelemetry openTelemetry = AutoConfiguredOpenTelemetrySdk.initialize().getOpenTelemetrySdk();
      return openTelemetry;
    }
  }
  ```

- 補足
  - 今回は`AutoConfiguredOpenTelemetrySdk`を使用する。
    - バックエンドの出力先など最低限の設定を環境変数やシステムプロパティで簡単に行える。
    - サンプリングなどのその他の設定を自動でやってくれる。
    - 各設定値を細かく指定したい場合は`OpenTelemetrySdk`を使う。
  - 環境変数については`docker-compose.yml`の中で既に設定されている。
    - `OTEL_EXPORTER_OTLP_ENDPOINT`
      - OTel コレクタインスタンスの出力先
      - 使用するエクスポータによって環境変数名が異なるので注意。
    - `OTEL_SERVICE_NAME`
      - 毎回サービス名を設定するのを省略するため、事前にサービス名を設定しておく。
      - ここで指定したサービス名でバックエンドは検出する。
    - 他に設定できる環境変数を知りたい方は[こちら](https://github.com/open-telemetry/opentelemetry-java/blob/main/sdk-extensions/autoconfigure/README.md)