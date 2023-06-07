前提条件を満たしたので[公式ページ](https://opentelemetry.io/docs/demo/docker-deployment/)に従ってデモを起動します。

<br>

### 手順

1. [デモリポジトリ](https://github.com/open-telemetry/opentelemetry-demo)をクローンする

    ```bash
    git clone https://github.com/open-telemetry/opentelemetry-demo.git
    ```{{exec}}

1. docker composeで起動する

    ```bash
    cd opentelemetry-demo/
    docker compose up --no-build
    ```{{exec}}

1. 起動したことを確認する

    ```bash
    docker compose ps
    ```{{exec}}

コンテナがすべて起動していることが確認出来たら次へ
