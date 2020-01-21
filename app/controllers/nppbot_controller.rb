class NppbotController < ApplicationController
  def eat
    render plain: "吃土啦"
  end
  
  def show_request_headers
    render plain: request.headers.to_h.reject{ |key, value| 
      key.include? '.'
    }.map{ |key, value|
      "#{key}:#{value}"
    }.sort.join("\n")
  end

  def request_body
    render plain: request.body
  end

  def response_headers
    response.headers['5566'] = 'QQ'
    render plain: response.headers.to_h.map{ |key, value|
      "#{key}: #{value}"
    }.sort.join("\n")
  end

  def show_response_body
    puts "==========這是修改前==========#{response.body}"
    render plain: "虎哇花哈哈哈"
    puts "==========這是修改後==========#{response.body}"
  end

  def sent_request
    uri = URI('http://localhost:3000/eat')
    http = Net::HTTP.new(uri.host, uri.port)
    http_request = Net::HTTP::Get.new(uri)
    http_response = http.request(http_request)

    render plain: JSON.pretty_generate({
      request_class: request.class,
      response_class: response.class,
      http_request_class: http_request.class,
      http_response_class: http_response.class
    })
  end

  def translate_to_korean(sentence)
    "#{sentence}油～～～～～"
  end
end
