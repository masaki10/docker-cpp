## DockerでC++環境構築

初回のみ（変更後も）
```
docker-compose up -d --build
```

二回目以降
```
docker-compose up -d
```

コンテナ内に入る
```
docker-compose exec cmake bash
```

コンテナ停止
```
exit
docker stop cmake_container
```

ビルド
```
cd src
mkdir build
cd build
cmake .. & make -j4
```