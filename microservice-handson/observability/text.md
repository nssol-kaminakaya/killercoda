前の手順で確認した負荷をオブザーバビリティツールを使って確認する。
opentelemetry-demoでは下記環境が用意されている。

| プロダクト | 説明 |
| ---- | ---- |
| Prometheus | メトリクスデータを受信あるいは取得し保管する |
| Grafana | Prometheusなどに保存されている監視データをグラフ化する |
| Jaeger | OpenTelemetryによって取得されたトレース情報を保存および可視化する |

詳細は別の勉強会で説明するのでお楽しみに。

### Prometheus

Prometheusにアクセスする。
通常、後述のGrafanaからアクセスするためfrontend-proxyでルーティングはされていない。そのためポート9090を直接指定してアクセスする。

- Killercodaでは[こちら]({{TRAFFIC_HOST1_9090}})からアクセスする
- ローカルで起動している場合は<https://localhost:9090>でアクセスできる

![Prometheus画面](./assets/prometheus.png)


### Grafana

Grafanaにアクセスする。
frontend-proxyで確認した通り/grafanaにルーティングされている。

- Killercodaでは[こちら]({{TRAFFIC_HOST1_8080}}/grafana)からアクセスする
- ローカルで起動している場合は<https://localhost:8080/grafana>でアクセスできる

![Grafana Home画面](./assets/grafana_home.png)

正方形が4つのマークをクリックしてダッシュボード一覧を確認する。
既にダッシュボードも作りこんでくれていることがわかる。

![Grafana Dashboard一覧画面](./assets/grafana_dashboard.png)

Demo Dashboardを開き、適当なサービスを選択するとメトリクスが取れていることがわかる。
※この場合CPUなどのインフラ情報はとれていない模様

![Grafana Demo Dashboard](./assets/grafana_demo_dashboard.png)


### Jaeger

Jaegerにアクセスする。
frontend-proxyで確認した通り/jaegerにルーティングされている。

- Killercodaでは[こちら]({{TRAFFIC_HOST1_8080}}/jaeger/ui)からアクセスする
- ローカルで起動している場合は<https://localhost:8080/jaeger/ui>でアクセスできる

![Jaeger Home画面](./assets/jaeger_home.png)

一番サービス連携が多いcheckoutserviceを選択してfind tracesボタンを押す。
すると、トレース一覧が出てくるのでどれか一つをクリックすると多種多様なサービスが連携して動いていることがわかる。

![Jaeger トレース画面](./assets/jaeger_trace.png)


### 番外編：GrafanaでJaegerを確認する

実はGrafanaでJaegerのトレースを確認することもできる。

1. Grafanaにアクセスして左ペインのExploreを選択
2. Exploreの右のプルダウンでJaegerに切り替える
3. Query TypeをSearchに変更する
4. Service Nameで適当なサービスを選択する
5. 右上のRun queryを実行する
6. 出てきたトレースのどれかを選択するとJaegerと同じトレース画面を見ることができる

![Jaeger トレース画面](./assets/grafana_jaeger.png)
![Jaeger トレース画面2](./assets/grafana_jaeger2.png)