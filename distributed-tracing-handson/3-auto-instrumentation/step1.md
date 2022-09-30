## 自動計装の設定

- 作業概要
    - 自動計装用のエージェントをダウンロードしてアプリケーションフォルダへ配置する
    - Dockerfileを修正してjavaagentを起動するように設定する

- 作業手順
    - JAVAエージェントをダウンロードする

        ```bash
        wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
        ```{{exec}}

    - JAVAエージェントをアプリケーションのフォルダへ移動する

        ```bash
        mv opentelemetry-javaagent.jar ~/otel-demo/demo
        ```{{exec}}

    - Editorで下記ファイルを開く。
        - `otel-demo/demo/Dockerfile`
    - Dockerfileの中に下記のように修正して保存する。

        ```docker
        # otel-demo/demo/Dockerfile
        # 変更前 (20行目)
        ENTRYPOINT ["java", "-jar","/app/spring-boot-application.jar"]

        # 変更後
        # opentelemetry-javaagent.jarをアプリケーションJARと同じ階層に配置する
        COPY opentelemetry-javaagent.jar /app

        # javaの引数にオプションを追加する。
        ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar","/app/spring-boot-application.jar"]
        ```