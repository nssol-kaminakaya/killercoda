## モジュールのインストール

- 作業概要
  - OpenTelemetry を Spring Boot で使用するためのモジュールを入れる。

- 作業手順
  - OpenTelemetry を使うために必要なモジュールを build.gralde に追加する。
    - build.gradle の中の dependencies 欄の最後に追記する。

    ```java
    // file: otel-demo/demo/build.gradle
    dependencies {

      // 略

      // OpenTelemetry Base
      implementation(platform("io.opentelemetry:opentelemetry-bom:1.11.0"))
      implementation("io.opentelemetry:opentelemetry-api")

      // OpenTelemetry Collector
      implementation("io.opentelemetry:opentelemetry-exporter-otlp:1.11.0")
      implementation("io.grpc:grpc-netty-shaded:1.41.0")

      // OpenTelemetrySdkAutoConfiguration
      implementation("io.opentelemetry:opentelemetry-sdk-extension-autoconfigure:1.11.0-alpha")
    }
    ```

- 補足
  - Java で使うために必要となるモジュール
    - opentelemetry-bom
    - opentelemetry-api
  - OTel Collector サービスを用いてバックエンドに送信するためのモジュール
    - opentelemetry-exporter-otlp
    - grpc-netty-shaded
  - SDK の自動設定を使う　※後述
    - opentelemetry-sdk-extension-autoconfigure
