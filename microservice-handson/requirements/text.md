[公式ページ](https://opentelemetry.io/docs/demo/docker-deployment/)に従ってデモを起動していきます。

起動する前にまずは前提条件を満たしているか確認しましょう。
今回はUbuntu環境ベースでコマンドを確認します。

1. dockerのステータスがactiveになっていることを確認する。

    ```bash
    systemctl status docker -n 1 --no-pager
    ```{{exec}}

1. docker composeのバージョンがV2.0.0以上であることを確認する

    ```bash
    docker compose version
    ```{{exec}}

1. メモリが4GBである。※少し足りないが今回はぎりぎり起動するためOKとする

    ```bash
    grep MemTotal /proc/meminfo
    ```{{exec}}

条件を満たしていることが確認出来たら次へ

### 補足

実はkillercodaのデフォルトのUbuntuイメージではdocker composeのバージョンが古く、起動時にスクリプトでインストールしている。