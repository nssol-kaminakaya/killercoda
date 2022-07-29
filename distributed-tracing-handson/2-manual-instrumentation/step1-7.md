### サンプルAPを停止する

- 作業概要
    - 後半に進む前にサンプルAPを停止する。
- 作業手順
    - サンプルアプリケーションを停止

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
    - 起動しているコンテナがないことを確認する

        ```bash
        docker-compose ps
        ```{{exec}}