# GOMTV Video Player

[곰TV 비디오 플레이어 가이드 문서](https://github.com/Seoinbo/gvplayer-doc/wiki)

## 서비스 장비에 파일 업로드 할 때

서비스 장비에는 'release' 디렉터리의 파일들만 올리면되고,
반대로 'node_modules' 디렉터리는 아무곳에도 올리면 안됩니다. 로컬에만 있으면 됩니다.

* `LOCAL` 로컬 파일, SVN에 올리면 안되는 파일
* `SVN` SVN까지 커밋해야하는 파일
* `WEB-SERVER` 웹 장비에 업로드해야하는 파일

```
  archive/ ----------------- SVN
  core/ -------------------- SVN
  css/ --------------------- SVN
  doc/ --------------------- SVN
  example/ ----------------- SVN
  external/ ---------------- SVN
  node_modules ------------- LOCAL
  player/ ------------------ SVN
  release/ ----------------- WEB-SERVER
  server/ ------------------ SVN
  CHANGELOG.md ------------- SVN
  Gruntfile.js ------------- SVN
  gvplayer-init.dev.js ----- SVN
  gvplayer-init.js --------- SVN
  package.json ------------- SVN
  README.md ---------------- SVN
  VERSION ------------------ SVN
```
