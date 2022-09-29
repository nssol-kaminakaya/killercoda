## 概要

- 本章ではマイクロサービスのサンプルアプリとして知られている Sock Shop というサンプルマイクロサービスアプリを使用する。
- [こちら](https://github.com/microservices-demo/microservices-demo)からダウンロードできる。
    - 既に環境にクローン済み
- [HP](https://microservices-demo.github.io/)にデプロイ方法が説明されている。
- ここではdocker-composeを用いてデプロイする。

## 起動

1. ディレクトリの移動

    ```bash
    cd ~/microservices-demo
    ```{{exec}}

1. サンプルアプリケーションを起動

    ```bash
    docker-compose -f deploy/docker-compose/docker-compose.yml up -d
    ```{{exec}}

1. すべてUpであることを確認する

    ```bash
    docker-compose -f deploy/docker-compose/docker-compose.yml ps
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

## 画面へアクセス

1. [サンプルアプリケーションにアクセスする]({{TRAFFIC_HOST1_80}})

## 停止

1. サンプルアプリケーションを停止

    ```bash
    docker-compose -f deploy/docker-compose/docker-compose.yml down
    ```{{exec}}