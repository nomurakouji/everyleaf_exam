* モデル名：Task
|カラム名|データ型|
|name|string|
|content|text|

* Herokuのデプロイ手順
 1. Herokuにログイン（heroku login）
 2. HerokuにAPPを作成（heroku create）
 3. アセットプリコンパイル（rails assets:precompile RAILS_ENV=production）
 4. rubyをgemからコメントアウト
 5. ruby local 2.6.6に切り替え
 6. gem install bundler -v 2.2.11
 7. bundle install
 8. heroku stack:set heroku-18
 9.  git add -A
 10. git commit -m "init"
 11. heroku buildpacks:set heroku/ruby
 12. heroku buildpacks:add --index 1 heroku/nodejs
 13. ルートを変更 config / route.rbに、以下のように記入で解決。root 'tasks#index'
 14. bundle lock --add-platform x86_64-linux
 15. git add -A
 16. git commit -m 'Add platform'
 17. git push heroku master
 18. heroku run rails db:migrate