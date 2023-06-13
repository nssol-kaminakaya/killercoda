<!-- ビルドしない場合の手順 -->
前提条件を満たしたので[公式ページ](https://opentelemetry.io/docs/demo/docker-deployment/)に従ってデモを起動します。


1. [デモリポジトリ](https://github.com/open-telemetry/opentelemetry-demo)をクローンする

    ```bash
    git clone https://github.com/open-telemetry/opentelemetry-demo.git -b 1.4.0
    ```{{exec}}

1. docker composeで起動する
    - ビルドに時間がかかるため--no-buildオプションでビルドせずコンテナイメージをそのまま起動する
    - -d オプションを指定してバックグラウンドでコンテナを起動する

    ```bash
    cd opentelemetry-demo/
    docker compose up --no-build -d
    ```{{exec}}

1. コンテナのstatusがすべてrunningになっていることを確認する

    ```bash
    docker compose ps
    ```{{exec}}

1. kafkaコンテナの起動が遅くてstatusがcreatedで止まってしまっている場合はstartを実行する

    ```bash
    docker compose start
    ```{{exec}}

1. コンテナのstatusがすべてrunningになっていることを確認して次へ

    ```bash
    docker compose ps
    ```{{exec}}

