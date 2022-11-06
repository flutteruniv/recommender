# レコメンだープロジェクトの始め方🌱🫰🏻

## ローカルへのクローン

#### コマンドでクローンする場合

recommenderフォルダを管理したいディレクトリにターミナルで移動し、

```
# HTTPS接続の場合
git clone https://github.com/flutteruniv/recommender.git
# SSH接続の場合
git clone git@github.com:flutteruniv/recommender.git
```
を実行してください。

#### Source Treeを使っている場合

新規 → URLからクローンで、  

ソースURLに``https://github.com/flutteruniv/recommender.git``  
(SSH接続の場合は``git@github.com:flutteruniv/recommender.git``)を入力し、

保存場所を設定の後、ローカルのrecommenderフォルダを作成してください。

## FVM の導入

作業者のFlutterのバージョンを揃えるために、  
Flutterバージョン管理システム(FVM(Flutter Version Management))を 
導入しています。
以下を読んで設定をお願いします。

#### Mac の方

[こちらの記事](https://zenn.dev/riscait/articles/flutter-version-management)を参考に、
FVMのインストール、パスの設定をしてください。

#### Windowsの方

[こちらの記事](https://qiita.com/idani/items/0e45d037b4c2a93840a7)を参考にFVMのインストール、パスの設定をしてください。  
``dart pub global activate fvm``で行う方法は非推奨です。
中盤に直接ダウンロードする方法が書かれているので、そちらで実行してください。

### FVMの適用

recommenderプロジェクトのルートディレクトリに移動し、

```
fvm install
```

を実行してください。

IDEでVScodeを使われている方は以上で設定完了です。

Android Studio を使われている方は、
``Preferences > Language & Frameworks > Flutter`` の ``SDK``内 ``Flutter SDK path``に以下のパスを入力します。
``/{プロジェクトまでのパス}/.fvm/flutter_sdk``


## テスト実行

エミュレータにてアプリを実行してみてください。

無事実行されれば初期設定は完了です。
