講義で挙げたマイクロサービスのメリットの1つである、開発の容易性について説明する。

マイクロサービスは基本疎結合に作られるため、連携部分の仕様が変わらない限りほかのサービスに影響なく簡単に変更できる。

ここではその一例としてad-serviceのキーワードを追加してデプロイする作業を例に挙げて説明する。
※メリットの説明としては微妙かもしれませんがご容赦ください。。

1. 下記のようにコードを修正する

    ```java
    private static ImmutableListMultimap<String, Ad> createAdsMap() {

        // 略
        Ad cleaningKit =
            Ad.newBuilder()
                .setRedirectUrl("/product/L9ECAV7KIM")
                .setText("Lens Cleaning Kit for sale. Buy one, get second one for free")
                .build();

        // testKitという対象商品を追加する
        Ad testKit =
            Ad.newBuilder()
                .setRedirectUrl("/product/AAAAAAAAAA")
                .setText("Test")
                .build();

        return ImmutableListMultimap.<String, Ad>builder()
            .putAll("binoculars", binoculars)
            .putAll("telescopes", explorerTelescope)
            .putAll("accessories", colorImager, solarFilter, cleaningKit)
            .putAll("assembly", opticalTube)
            .putAll("travel", travelTelescope)
            .putAll("test", testKit) // testKitをtestというキーワードに結び付ける
            // Keep the books category free of ads to ensure the random code branch is tested
            .build();
        }
    ```

1. adserviceをビルドしなおす
    ```
    docker copmpose build adservice
    ```{{exec}}

1. 起動しなおす
    - ビルドしたものだけコンテナが再作成される
    - docker composeの仕様で依存コンポーネントすべて再作成されるが、実際はadserviceだけ再作成すればよい
    ```
    docker compose up --no-build
    ```{{exec}}

1. curlコマンドで確認する
    ```
    curl -X GET "http://localhost:8080/api/data?contextKeys=test" | jq .
    ```{{exec}}