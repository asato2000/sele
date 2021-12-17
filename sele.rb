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
i=0
5.times do
  i = i + 1
  session.find_elements(:class, "yuRUbf"). each do |title|
  puts title.find_element(:tag_name, "a").attribute("href")
  end

  if session.find_elements(:xpath, '//*[@id="pnnext"]').size >0
    session.find_element(:xpath, '//*[@id="pnnext"]').click
    sleep(2)
  else
  break
  end
end 

# # 5秒遅延(処理が早すぎてページ遷移前にスクリーンショットされてしまうため)
sleep(5)

# # スクリーンショットをして"zenn.png"で保存する(保存される場所は、コード実行箇所)
# if session.save_screenshotzenn.png')
#   # スクリーンショットができたら出力する
#   puts "スクリーンショットされました！"


# ブラウザを終了
session.quit
