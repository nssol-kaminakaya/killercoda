サンプルアプリケーションを起動していきましょう

<br>

### Solution

````bash
cd ~/otel-demo
```{{exec}}

Build

```bash
docker-compose build
```{{exec}}

Run

```bash
docker-compose up -d
```{{exec}}


# State が Up 状態であることを確認する

```bash
$ docker-compose ps
      Name                   Command                  State       ...
-----------------------------------------------------------------...
db               docker-entrypoint.sh mysql ...   Up             ...
demo             java -Xmn256m -Xmx768m -ja ...   Up             ...
jaeger           /go/bin/all-in-one-linux         Up             ...
otel-collector   /otelcontribcol --config=/ ...   Up             ...
prometheus       /bin/prometheus --config.f ...   Up             ...
zipkin           start-zipkin                     Up (healthy)   ...
```
````
