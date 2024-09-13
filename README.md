# サウナの日記アプリ：　「サウナ探検隊」

最終編集日：    2024/08/19

# このアプリの概要
* サウナ活動(以下「サ活」)をする人のためのアプリ
* 毎回のサ活を記録し、振り返りが可能!
* 他人のサ活投稿を見て、参考にすることができる
* 記録することで、ととのうサウナの入り方がわかる
  
  ユーザーもサウナ施設に関する情報を提供できるようにして、サウナデータベースを作ることが目標です！

# 使用技術
* Ruby 3.2.2
* Ruby on Rails 7.0.8.1
* Turbo
* Google Maps Platform API
* SQLite(利用者数が少ないためデフォルトのまま使用)

## ユーザー側の機能一覧
* サ活の投稿・編集・削除
* 投稿にいいねとコメント
* サウナ施設のことについて調べることができる
* サウナ施設に関する情報提供

### 新規登録とログイン
* 新規登録とログインをする必要がある
    - しない場合は以下のほとんどの機能が利用できない
    - ___googleアカウント___で認証が可能である
* パスワードを忘れてもリセットメールを送信することができる

### マイページ
* いいねの多いサウナ
    - いいねの数が多いサウナを見ることができます 
* ページを開くまたは更新するたびに、4種類のうちランダムで短いメッセージが表示されます

### サウナ施設一覧
* サウナ施設を検索できます
    - 画面上部の検索フォームに入力すると、その文字列の入った名前のサウナ施設が表示されます。
    - フラッシュメッセージで検索結果が見つかったかどうか知らせ、見つかった場合はその件数も表示します。

### サウナ施設の詳細
* `Google maps`でサウナ施設の場所を把握できる
    - google mapsのAPIを使用している。

## 管理者側の機能一覧
__注意点__
`seeds.rb`に記述されている管理者は開発時のものであり、本番環境では使用できません。
  
* サウナ施設の投稿
    - サウナ施設の名前、住所、サウナ室や水風呂の温度、その他説明文を入力します
* サウナ施設の編集・削除
    - 登録済みのサウナ施設を編集することができます
    - 不適切な場合は削除ができます
* サ活投稿の削除
    - 利用規約に反するような投稿は削除することができます


# 製作者から
ここからはアプリを制作する上で工夫した点や改善点を紹介していきます。  


## 注目ポイント
* シンプルなデザインと直感的な操作
    - 主に白、黒色でサイトが構成されています。ユーザー側がクリックする必要のある箇所は青色で分かりやすくしています
    - 背景は白色、文字は黒色、ボタンは青色であるため、慣れ親しんだ感覚で操作が可能です
    - 表示されているページが何か分かりやすくするために、h1タグ周辺にスペースを作っています

* サウナ施設について
    - サウナ施設が複数のサウナ室と水風呂の情報を保存できるようにDBを設計しました(最大10個まで)
    - 管理者は登録済みのサウナ施設を編集できます。この際、登録済みのサウナ室と水風呂はあらかじめフォームに入力されたままになるため、10個以上保存できないように工夫してあります。詳細は`admin/saunas_controller.rb`の24,25行目
    - ユーザーからの情報提供フォームを作成し、一つ以上の問いに回答している場合のみ投稿できるようにした。（全ての問いに回答していない場合はフラッシュメッセージにて投稿できないことをしらせる。）
    - サウナ施設の検索機能を実装しました。現在、入力した文字列がサウナ施設名に含まれるかどうかで検索しています。
    - 住所から緯度経度を求め、Google Mapsにマーカーありで表示しています。

* （管理者）サウナ施設の登録フォームの非同期通信
    - サウナ室と水風呂の入力フォームをJavaScriptを用いて非同期で表示・非表示できるようにしてあります
    - また、10個を超える入力フォームは表示されないようにしてあります

* 毎月1日に退会済みユーザーの物理削除
  
* 非同期いいね機能の実装
    - `Turbo`を用いた非同期のいいねを実装しました。そのため、いいねボタンを押すといいねボタンだけが変化します
  
* サ活投稿へのコメント機能の実装
    - コメントの文字数は140字以内にする必要があります
    - 削除は可能ですが編集はできないようになっています


## 追加機能（予定）
* 不適切な投稿に対してユーザーが報告できるようにする。不適切と判断した場合、管理者によるユーザーの強制退会
