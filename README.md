# markdown記法でテーブルスキーマ（モデル名、カラム名、データ型）を記載する

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

# label table

| カラム名 | データ型 |
| ------- | ------- |
| label_1 | string  |
| label_2 | string  |
| label_3 | string  |
| task_id | bigint  |
