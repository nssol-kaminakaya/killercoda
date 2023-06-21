マイクロサービスでは各サービスが提供するAPIを用いて相互連携する。

### サービス一覧

opentelemetry-demoでは下記のようなサービスがそれぞれAPI機能を提供している。
サービス間のやり取りは[アーキテクチャ図](https://opentelemetry.io/docs/demo/architecture/)に記載の通りHTTPないしgRPCでやり取りしている。

| サービス名 | 構成 | 説明 |
| --- | --- | --- |
| ad-service | Java | 与えたキーワードに応じた商品情報を返す。指定しない場合はランダムな商品を返す |
| cart-service | DotNet | カートに入れた商品リストをRedisにCREATE/DELETE/SELECTする |
| checkout-service | Go | カートの情報から注文情報をキューに入れ、payment, shipping, emailサービスに連携する |
| currency-service | C++ | 通貨一覧や通貨の変換を行うサービス。本来はヨーロッパ銀行など最新のレートを高速で取得することが必要などシビアなサービスであるが、そこまでは実装していない|
| email-service | Ruby | 本来は注文の確認メールを送るサービスだが、ここではログ出力するのみ|
| payment-service | JavaScript | 本来は与えられたクレジットカード情報をもとに決済するが、ここではトランザクションIDを返すのみ|
| product-catalog-service | Go | リストファイルから目的の商品情報を取得したり検索したりするサービス |
| recommendation-service | Python | カートにある商品情報から関連する商品場を返すサービス |
| shipping-service | Rust | 本来なら配達コストを計算し、配達依頼をするが、ここでは配達コストをログに出力するのみ |

### API Gateway

上記のようにたくさんのAPIがそれぞれ別のホスト、ポートで公開されていた場合、ユーザがアクセスしてくるのは大変である。
そのため、APIを集約するAPI Gatewayを作成するケースが多く、パブリッククラウドではサービスとして提供されている。

opentelemetry-demoでは、frontendで実装されている。

ad-serviceの与えられたキーワードをもとに商品一覧を出力するAPIを例に示す。
表に記載の通りad-serviceはcontextKeysをクエリパラメータとして受け取り、関連商品があればその商品リストを、関連商品がなければランダムに商品リストを返す。

```javascript
// file: opentelemetry-demo/src/frontend/gateways/Api.gateway.ts
const basePath = '/api';

const ApiGateway = () => ({
    // 略
    listAds(contextKeys: string[]) {
        return request<Ad[]>({
            url: `${basePath}/data`,　// URLは/api/dataとなる
            queryParams: {
                contextKeys, // クエリパラメータとしてcontextKeysを受け取る
            },
        });
    }
    // 略
});

export default ApiGateway();
```

curlコマンドを用いてAPIを確認してみる。

登録されているキーワードの場合(固定)
```
curl -X GET "http://localhost:8080/api/data?contextKeys=travel" | jq .
```{{exec}}

登録されていないキーワードの場合（ランダム）
```
curl -X GET "http://localhost:8080/api/data?contextKeys=test" | jq .
```{{exec}}

### 参考

#### データの保存

マイクロサービスではサービスは疎結合であるためデータの蓄積場所も多種多様である。
今回使われているのは下記の通り。

| 構成 | 説明 |
| ---- | ---- |
| Redis | cart情報を蓄積させるインメモリデータベース |
| Kafka | checkout-serviceによって生成された注文情報が入るキュー|
| Postgres | 後述のfeature flag serviceが使用するDB|

ここに記載のないものは各サービス内のコードやjsonリストファイルなどで管理されている。

#### 使用しないサービス

キューを処理するaccounting-serviceとfrauddentection-serviceが存在するが、ただのモックサービスであり、外部公開していないので今回は使用しない。
