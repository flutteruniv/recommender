# ブランチについて🌳

各ブランチの詳しい使い方は、[ワークフロー](https://github.com/flutteruniv/recommender/blob/develop/doc/workflow.md)を確認してください。

## mainブランチ

- リリースされたアプリのコードを保持するブランチ
- リリース、アップデートタイミングで更新
- developからのプルリクエストのみで更新される
- **絶対にpush origin main としてはいけない**

## developブランチ

- 開発の最新状態を保持するブランチ
- feature ブランチからのプルリクエストのみで更新される
- **絶対にpush origin develop としてはいけない**

## featureブランチ

- ``feature/[issue番号]``の名前を持つ
- 各作業者が作業するブランチ
- 必ずdevelopブランチの最新からブランチを作成する
- 作成、更新は自由に可能
- 作業後、developへプルリクエストを送る
- プルリクエストの承認後、ブランチを削除する

