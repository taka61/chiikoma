# chiikoma
![faviconのコピー](https://user-images.githubusercontent.com/80372144/155834723-7b806b5a-479f-48e2-88d8-26cf83cf06a1.png)


緊急度が高くないから…頼まれごとではないから…とついつい放置してしまいがちな「自分のためだけの小さな困りごと」はありませんか？

ちいこまは「緊急度は高くないがいつか解決したいと思っている自分のためだけの小さな困りごと」の解決をお手伝いするアプリケーションです。
使い方は簡単！Todoアプリのように自分だけの小さな困りごと 「ちいこま」を登録し、あなたの「ちいこま」を管理することができます。

また「今週どれくらい自分の困りごとを解決してあげることができたか」
あなたの1週間のがんばりを確認する機能もあるので、「自分のことをどれだけケアしてあげることができたか」も分かり、
モチベーションアップにも繋がります💪

## URL
https://chiikoma.herokuapp.com

## 開発環境
* Ruby 3.1.0
* Rails 6.1.4

## ローカルでの立ち上げ方

```
$ bin/setup
$ rails s
```

## seed(テストデータ)

```
rails db:seed
```

### テスト用アカウント

```
メールアドレス: otameshi@sample.com
パスワード: password
```

## テスト

```
$ bundle exec rails test:all
```
## Lint

```
$ bundle exec rubocop
$ bin/yarn lint
```
## スクリーンショット

#### TOP画面
<img width="1397" alt="スクリーンショット 2022-04-06 13 16 26" src="https://user-images.githubusercontent.com/80372144/161894708-235a6621-9003-4cc9-adee-3cb32fc14948.png">


#### ちいこま登録
<img width="693" alt="スクリーンショット 2022-04-06 13 22 11" src="https://user-images.githubusercontent.com/80372144/161895214-2d200dcc-396b-46b6-92b0-5a3cbdf9543e.png">


#### ちいこま詳細
<img width="315" alt="スクリーンショット 2022-04-06 13 19 03" src="https://user-images.githubusercontent.com/80372144/161894958-fccac0e9-4d1a-484e-8195-e887a1e33ae9.png">


#### 1週間のがんばり
<img width="600" alt="スクリーンショット 2022-04-06 13 20 50" src="https://user-images.githubusercontent.com/80372144/161895088-e805767b-b104-45ed-94a0-481cbecd4067.png">

