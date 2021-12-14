require 'selenium-webdriver'

# ブラウザの指定(Chrome)
session = Selenium::WebDriver.for :chrome
# 10秒待っても読み込まれない場合は、エラーが発生する
session.manage.timeouts.implicit_wait = 10
# ページ遷移する
session.navigate.to "https://google.com/"

# ページのタイトルを出力する
# puts session.title

# 検索フォームの取得(この場合はname属性で取得している)
query = session.find_element(:name, 'q')
# "zenn"を自動入力する
query.send_keys('web制作会社　パートナー')

# # 送信(検索)
query.submit

puts session.find_element(:xpath,"/html/body/div[7]/div/div[10]/div[1]/div/div[2]/div[2]/div/div/div[2]/div/div/div[1]/a/h3
  ").text

# # 5秒遅延(処理が早すぎてページ遷移前にスクリーンショットされてしまうため)
sleep(5)

# # スクリーンショットをして"zenn.png"で保存する(保存される場所は、コード実行箇所)
# if session.save_screenshotzenn.png')
#   # スクリーンショットができたら出力する
#   puts "スクリーンショットされました！"
# end

# ブラウザを終了
session.quit
