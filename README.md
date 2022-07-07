# markdown記法でテーブルスキーマ（モデル名、カラム名、データ型）を記載

# user table

| カラム名 | データ型 |
| -------- | -------- |
| name  | string |
| email | string |
| password_digest | string |

# task table

| カラム名 | データ型 |
| ------ | ------- |
| title | string |
| content | text |
| status | string |
| due | string |
| user_id | bigint |
| created_at | timestamp |
| updated_at | timestamp |

# task_label table
| カラム名 | データ型 |
| ------- | ------- |
| task_id | bigint |
| label_id | bigint |

# label table

| カラム名 | データ型 |
| ------- | ------- |
| name | string  |


| Herokuにデプロイする方法 |
| --------------------- |
| Herokuに新しいアプリケーションを作成する |
| コミットする |
| Herokuにデプロイをする |
| マイグレーション（テーブル作成）は手動で実行する |
