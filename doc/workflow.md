# ワークフロー🙋🏻‍♀️🖤

## タスクが割り当てられたら

1. アサインされたIssueを見つけます。もしくは、自分をアサインしたIssueを立ち上げます。

2. [Projects](https://github.com/orgs/flutteruniv/projects/25/views/1)にて、そのIssueをIn Progressに移動します。

3. **developブランチ**から``feature/[issue番号]``の名前でブランチを作成します。  
```zsh
# developブランチに移動
git checkout develop
# developブランチの最新のデータを取得
git pull origin develop
# featureブランチを作成、移動
git checkout -b feature/issue1
```

4. コード修正、追加等の作業をします。

5. 作業後、developブランチの最新と比較の上、add,commit（コメント付き）をし、``origin feature/[issue番号]``にPushします。  
    - **注： 絶対にdevelop,mainに直接Pushしないこと！**
```zsh
# featureブランチに移動
git checkout feature/issue1
# developブランチの最新のデータを取得
git pull origin develop

# 反映データの確認(問題があれば修正し一番最初に戻る。)
# 変更したファイルが赤文字で表示される
git status
# 変更したファイルをインデックスに追加（変更したファイル全てを一括で追加する場合は　git add . -p）
git add -p <修正したファイルパス>　
修正差分箇所が色分けされるので、意図通りの修正になっているか確認し、問題がなければ「y」、間違いがあれば「n」を打ち込む
# コミットメッセージを入力し、コミット
git commit -m 'メッセージ'
# featureブランチにPush
git push origin feature/issue1
```

6. 作業完了後、[GitHub](https://github.com/flutteruniv/recommender)にて、プルリクエストを作成するか問われるので、作成します。

7. プルリクエストのコメントに作業内容がわかるように内容を記載し、送信します。  
    - レビュワーの登録を忘れずに行うこと！(松丸さん or yuiさん or minn)
    - CI(自動チェック)の結果を確認すること。failedの場合は修正し、5に戻る。
    - コンフリクトが発生した場合は、修正し再度コミットすること。

8. レビューが承認されたら、速やかにマージを行います。  
    - マージされたブランチは削除すること。

9. マージ後、issueをクローズします。
