# SQL実行の内部動作

![](./drawio/output/sqlExecutor.png)

### 構文チェック

SQLの構文チェックを行う。

```text
SQL> SELECT EMP_ID FORM EMPLOYEES;
SELECT EMP_ID FORM EMPLOYEES
                   *
行1でエラーが発生しました。:
ORA-00923: FROMキーワードが指定の位置にありません。
```

### セマンティクス・チェック

SQL文内のオブジェクトおよび列が存在するかなど、文の意味が有効かどうかチェック。

```text
SQL> SELECT EMPID FROM EMPLOYEES; 
SELECT EMPID FROM EMPLOYEES
       *
行1でエラーが発生しました。:
ORA-00904: "EMPID": 無効な識別子です。
```

### 共有プール・チェック

共有プールを検索して、解析済みのSQL文が存在するか確認する。

- ない場合：ハードパース
- ある場合：ソフトパース

なお、以下のようなSQLは別々のSQL文として解釈される。
つまり、WHERE句で指定する`EMP_ID`が違うだけのSQLであり、人間からすると同じに見えるが
オプティマイザからすると異なるSQLと解釈される。

```sql
-- SQL1
SELECT EMP_ID FROM EMPLOYEES WHERE EMP_ID = 1;
--- SQL2
SELECT EMP_ID FROM EMPLOYEES WHERE EMP_ID = 2;
```

同じSQLとして解釈させる場合は、バインド変数を使用する。

```sql
SELECT EMP_ID FROM EMPLOYEES WHERE EMP_ID = :empId
```

### 行ソースの作成

オプティマイザから最適な実行計画を受け取り、SQLエンジンで実行される反復実行計画を作成。
反復実行計画は、行セットをどのオブジェクトからどのように取得するかという行ソースをツリー状に構成したもの。