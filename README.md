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
<img width="1422" alt="スクリーンショット 2022-02-26 17 05 06" src="https://user-images.githubusercontent.com/80372144/155835634-1761cfdb-b6db-48c6-ad5e-a719916b16ea.png">

#### ちいこま登録
<img width="1340" alt="スクリーンショット 2022-02-26 17 06 25" src="https://user-images.githubusercontent.com/80372144/155835638-20d2e7e1-35ab-4935-9056-8132b021227b.png">

#### ちいこま詳細
<img width="319" alt="スクリーンショット 2022-02-26 17 08 33" src="https://user-images.githubusercontent.com/80372144/155835639-9e9dba76-463f-4236-84bc-4f6937d73c79.png">

#### 1週間のがんばり
<img width="303" alt="スクリーンショット 2022-02-26 17 09 35" src="https://user-images.githubusercontent.com/80372144/155835640-8ddba964-e046-4f0d-97ee-46db4e027f85.png">
