# 概要
`docker`と`Devcontainer`を使用した`ruby on rails`の環境構築を行う

# DB関連のコマンド
デフォルトのデータベースに接続
```sh
psql -d postgres
```

データベースを指定して接続
```sh
psql -d データベース名
```

データベースとユーザを指定して接続
```sh
psql -d データベース名 -U ユーザ名
```

# docker 関連のコマンド
## 削除
```sh
docker compose down --rmi all --volumes  --remove-orphans && docker volume prune -f
```

## 全体削除
```sh
docker system prune -f
```

# 参考資料
- [[公式]クィックスタート: Compose と Rails](https://matsuand.github.io/docs.docker.jp.onthefly/samples/rails/)
- [[公式 docker hub] ruby](https://hub.docker.com/_/ruby)
- [[公式 docker hub] postgres](https://hub.docker.com/_/postgres)
- [[公式 docker hub] adminer](https://hub.docker.com/_/adminer/)
- [Dockerfile から上の階層のディレクトリを参照する](https://qiita.com/TKR/items/ac29ee783bc4684d0612)
- [Docker ComposeでDockerfileをビルドする際に親ディレクトリのファイルをコピーする](https://zukucode.com/2020/08/docker-compose-parent-directory.html)
- [dockerでコンテナが立ち上がらないときやってみること](https://qiita.com/mom0tomo/items/35dfacb628df1bd3651e)
- [Dev Container + Rails + vscode-rdbg (debug.gem)](https://zenn.dev/takeyuwebinc/articles/50793a2313824a)
- [Docker Compose な開発環境にちょい足し3分で作るVSCode devcontainer](https://zenn.dev/saboyutaka/articles/9cffc8d14c6684)
- [【Rails】環境変数（.env）を設定・取得する方法](https://labo.kon-ruri.co.jp/rails-dotenv/)
- [NGINX ロードバランス](http://mogile.web.fc2.com/nginx/admin-guide/load-balancer.html)
- [nginxでロードバランシング＆リバースプロキシの設定](https://qiita.com/mby/items/9ece46893b0967c2296d)
- [VSCode Devcontainer 放浪記](https://zenn.dev/streamwest1629/articles/vscode_wanderer-in-devcontainer)
