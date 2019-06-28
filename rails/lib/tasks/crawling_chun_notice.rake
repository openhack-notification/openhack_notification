## rake "send_notification:send_notification"

namespace :send_notification do
  require 'net/https'
  require 'uri'
  require 'json'
  
  task send_notification: :environment do
    
    ## SMS 문자 코드 시작
    uri = URI.parse('https://api.bluehouselab.com/smscenter/v1.0/sendsms')
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri, initheader={'Content-Type' =>'application/json; charset=utf-8'})
    
    req.basic_auth "#{ENV["SMS_ID"]}", "#{ENV["SMS_KEY"]}"
    
    array = Array.new
    Subscribe.all.each_with_index do |x, i|
      CrawlList.all.each_with_index do |y, j|
        puts "**** 로그기록 : x는 #{i}, y는 #{j} ****"
    
        if (x.post.id == y.post.id && x.switch == true && x.sms == true)
          if x.keyword_2 == nil
            @t = CrawlList.where("title like ?", "%#{x.keyword_1}%")
          elsif x.keyword_2 != nil
            @t = CrawlList.where("title like ?", "%#{x.keyword_1}%").where("title like ?", "%#{x.keyword_2}%")
          end
              
          array.push("0#{x.user.phone_number}")
          puts "유저 #{x.user.id} : #{@t.count}"
          puts "유저 연락처 #{array}"
          @t.each do |z|
            
            req.body = {
              sender: "01084364674",
              receivers: array,
              content: "#{z.title} / #{z.url}"
            }.to_json
            
            puts "*********** SEND MESSAGE RESULT ***************"
            resp = http.request(req)
            puts resp.code
            puts resp.body
            puts "*********** SEND MESSAGE RESULT END ***************"
            ## SMS 문자 코드 종료
            
            
            puts "#{z.title}"
          end
          
          if array != nil
            array = []
            puts "배열 초기화 완료"
          end
          
          break;
        end
      end
    end
    
  end
end