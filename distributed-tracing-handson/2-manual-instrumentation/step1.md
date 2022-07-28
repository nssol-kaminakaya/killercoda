otel-demoというサンプルアプリケーションを起動します。
既に`~/otel-demo`に配置されています。

<br>

### 手順

1. ディレクトリの移動

      ```bash
      cd ~/otel-demo
      ```{{exec}}

1. ビルドする

    ```bash
    docker-compose build
    ```{{exec}}

1. サンプルアプリケーションを起動

    ```bash
    docker-compose up -d
    ```{{exec}}

1. すべてUpであることを確認する

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

### 完了条件

コンテナがすべて起動していることが確認出来たら次へ