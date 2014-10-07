require 'json'
require 'active_support/core_ext/hash'
require 'net/http'

while true
  url = URI.parse('http://realtime.ridemcts.com/bustime/api/v1/getpredictions?key=ZpvujbixipZuh6yZu7MqkGa3a&stpid=891')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  } 

  json = Hash.from_xml(res.body).to_json

  puts(File.exists?("buses.json"))

  File.open('buses.json', 'w+') { |file| 
    file.write(json)
    file.close
  }

  File.open('time.json', 'a+') { |file| 
    file.write(Time.now.strftime('%Y%m%d%H%M%S%L'))
    file.write("\n")
    file.close
  }
  sleep 10
end


