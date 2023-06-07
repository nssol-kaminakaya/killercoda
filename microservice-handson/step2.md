前提条件を満たしたので[公式ページ](https://opentelemetry.io/docs/demo/docker-deployment/)に従ってデモを起動します。

<br>

## 手順

### dockerのステータスがactiveになっていることを確認する

```bash
systemctl status docker -n 10
```{{exec}}

### docker composeのバージョンがV2.0.0以上であることを確認する

```bash
docker compose version
```{{exec}}

### メモリが4GBであることを確認する

```bash
grep MemTotal /proc/meminfo
```{{exec}}

コンテナがすべて起動していることが確認出来たら次へ

## 補足

実はkillercodaのデフォルトのUbuntuイメージではdocker composeのバージョンが古く、起動時にスクリプトでインストールしている。