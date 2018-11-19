# serverless-framework-golang-sample

serverless framework for Go のサンプル。
コードはほぼ https://qiita.com/Yamashou/items/ae600c75ce91e123c579 から拝借

## local開発
serverless framework for go だと `sls invoke local` できない(2018年9月時点)のでsamを使う

- docker install
- sam-cli [install](https://github.com/awslabs/aws-sam-cli#get-started)
- gomon(goファイル監視用ライブラリ) `go get -u github.com/c9s/gomon`

1. ファイル監視
  ./line-bot内のgoファイルに変更があればbin/botが更新される(make buildのwatch版)
   ```
   $ make run
   ```
2. ローカル環境にAPIサーバ(apiGateway)を立てる。
   samのtemplate.yamlで定義したurlでアクセス可
   (POST localhost:3000/callback)
   ```
   $ sam local start-api
   ```

## ビルド

```
$ make build
```

## デプロイ

```
$ make deploy stage=[ステージ名] profile=[awsのprofile]
```

## デプロイしたLambdaの実行
```
sls invoke -f [Function名(line-bot)] --stage [ステージ名] --aws-profile [awsのprofile] --path [event変数を定義したjsonファイル] -v
```

## デプロイしたリソースの削除
```
$ sls remove --stage [ステージ名] -v
```