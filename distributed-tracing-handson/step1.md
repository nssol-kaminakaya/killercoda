otel-demoというサンプルアプリケーションを起動します。
既に`~/otel-demo`に配置されています。

<br>

### 手順

1. ディレクトリの移動

```bash
cd ~/otel-demo
```{{exec}}

2. ビルドする

```bash
docker-compose build
```{{exec}}

3. サンプルアプリケーションを起動

```bash
docker-compose up -d
```{{exec}}


4. すべてUpであることを確認する

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
