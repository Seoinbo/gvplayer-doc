# GOMTV Video Player

[곰TV 비디오 플레이어 가이드 문서](https://github.com/Seoinbo/gvplayer-doc/wiki)

## 서비스 장비에 파일 업로드 할 때

플레이어를 구성하는 모든 파일들이 서비스에 필요하지는 않습니다. 개발에 필요한 파일들은 SVN 장비까지 올리는 것만으로도 충분합니다. 서비스에 필요한 파일은 `release` 디렉터리에 있는 파일뿐입니다.

* `LOCAL` 로컬 파일, SVN에 올리면 안되는 파일
* `SVN` SVN까지 커밋해야하는 파일
* `WEB-SERVER` 웹 장비에 업로드해야하는 파일

```
  gvplayer/
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
