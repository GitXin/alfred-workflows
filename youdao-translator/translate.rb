require './common_methods'
require 'net/http'
require 'digest'
require 'json'

def parse(data)
  items = []

  (data['translation'] || []).each { |e| items << { title: e } }

  (data['web'] || []).each { |e| items << { title: e['value'], subtitle: e['key'] } }

  explains = data['basic']['explains'] rescue nil
  explains.each { |e| items << { title: e } } if explains

  items
end

def load_config
  unless File.exists? 'config.json'
    output(
      title: 'Please config your appkey and secretKey',
      subtitle: 'copy config.template.json to config.json'
    )
  end
  JSON.parse(File.read('config.json'))
end

def payloads(word, config)
  salt = Time.now.to_i.to_s
  {
    q: word,
    from: 'auto',
    to: 'auto',
    appKey: config['appKey'],
    salt: salt,
    sign: Digest::MD5.hexdigest(config['appKey'] + word + salt + config['secretKey'])
  }
end

begin
  config = load_config

  word = ARGV.join(' ')
  output(title: 'please input word to translate') if word.size == 0

  response = Net::HTTP.post_form(
    URI('http://openapi.youdao.com/api'),
    payloads(word, config)
  )
  data = JSON.parse response.body

  output(parse(data))
rescue Exception => e
  output(
    title: 'Something was wrong',
    subtitle: e
  )
end
