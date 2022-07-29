### 4. サンプル AP を動かす

- 作業概要
  - docker-compose でビルドと AP の実行を行う。
- 作業手順
  - ディレクトリの移動

    ```bash
    cd ~/otel-demo
    ```{{exec}}

  - ビルドする ※数分かかる

    ```bash
    docker-compose build
    ```{{exec}}

  - サンプルアプリケーションを起動

    ```bash
    docker-compose up -d
    ```{{exec}}

  - すべてUpであることを確認する

    ```bash
    docker-compose ps
    ```{{exec}}

    実行結果例

    ```plan
        Name                   Command                  State       ...
    -----------------------------------------------------------------...
    db               docker-entrypoint.sh mysql ...   Up             ...
    demo             java -Xmn256m -Xmx768m -ja ...   Up             ...
    jaeger           /go/bin/all-in-one-linux         Up             ...
    otel-collector   /otelcontribcol --config=/ ...   Up             ...
    prometheus       /bin/prometheus --config.f ...   Up             ...
    zipkin           start-zipkin                     Up (healthy)   ...
    ```