require 'yaml'
require 'net/http'
require 'net/https'
require 'open-uri'
require 'json'
#加载yml文件
def test
  response = YAML.load(File.open("yaml.yml"))
  puts "查询字符串#{"a"}"
  response.each do |k,v|
    ss = Thread.new{
      url_response = Net::HTTP.get(URI.parse(v))
      File.new('test.json', "w+").syswrite(url_response)
      puts "------#{k}-----"
      js_response = JSON.parse(File.read('test.json'))
      # puts js_response.class
      js_response.each do |a,b|
        if b.to_s["a"]
          puts "Key: #{a}"
        end
      end
    }
    sleep 5
    ss.join
  end
end
test
