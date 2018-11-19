# serverless-framework-golang-sample

serverless framework for Go のサンプル。
コードはほぼ https://qiita.com/Yamashou/items/ae600c75ce91e123c579 から拝借

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