サンプルアプリケーションを起動していきましょう

<br>

### 手順

ディレクトリの移動

````bash
cd ~/otel-demo
```{{exec}}

ビルドする

```bash
docker-compose build
```{{exec}}

サンプル AP を起動する

```bash
docker-compose up -d
```{{exec}}


# State が Up 状態であることを確認する

$ docker-compose ps
      Name                   Command                  State       ...
-----------------------------------------------------------------...
db               docker-entrypoint.sh mysql ...   Up             ...
demo             java -Xmn256m -Xmx768m -ja ...   Up             ...
jaeger           /go/bin/all-in-one-linux         Up             ...
otel-collector   /otelcontribcol --config=/ ...   Up             ...
prometheus       /bin/prometheus --config.f ...   Up             ...
zipkin           start-zipkin                     Up (healthy)   ...
````
