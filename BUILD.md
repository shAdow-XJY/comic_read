## pub cmd
flutter build web --release --base-href /comic_read/
flutter build web --no-web-resources-cdn --release --base-href /comic_read/
<details>
<summary>flutter build web</summary>
<div>
flutter build web --release
[flutter build web --web-renderer html --release] ❌

✅ 新的flutter版本没法用html构建了，一定需要下载渲染器了，太难绷了
flutter build web --release
flutter build web --wasm --release

flutter build web --no-web-resources-cdn --release
这样打包时，canvaskit.wasm 会直接放进你的 build/web/canvaskit/ 目录，访问时直接从你的服务器下载，不会去 gstatic 了。

优点
•	不依赖 Google CDN
•	访问速度取决于你的服务器

缺点
•	包体积会变大（多 1.1~1.5 MB）
</div>
</details>

> cd /d path
# pub cmd
cd /d E:\AndroidStudioProjects\novel_read
set http_proxy=127.0.0.1:10809
set https_proxy=127.0.0.1:10809

注： 如果出错的话，cmd打开，不是idea的terminal，也不是power shell
