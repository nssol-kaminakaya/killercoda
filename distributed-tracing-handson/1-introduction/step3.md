サンプルアプリケーションを停止する。

### 手順

1. サンプルアプリケーションを停止

    ```bash
    cd ~/otel-demo
    docker-compose down
    ```{{exec}}

    実行結果例

    ```plan
    Stopping demo           ... done
    Stopping otel-collector ... done
    Stopping zipkin         ... done
    Stopping prometheus     ... done
    Stopping db             ... done
    Stopping jaeger         ... done
    Removing demo           ... done
    Removing otel-collector ... done
    Removing zipkin         ... done
    Removing prometheus     ... done
    Removing db             ... done
    Removing jaeger         ... done
    Removing network otel-demo_default
    ```

1. 起動しているコンテナがないことを確認する

    ```bash
    docker-compose ps
    ```{{exec}}
### 完了条件

コンテナがすべて停止していることが確認出来たら次へ