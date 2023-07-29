require 'rack'
require 'json'

class BashPlugin
  def call(env)
    req = Rack::Request.new(env)

    if req.path_info == '/execute' && req.post?
      command = JSON.parse(req.body.read)['command']
      output = `#{command}`
      [200, { 'Content-Type' => 'application/json' }, [{ output: output }.to_json]]
    elsif req.path_info == '/.well-known/ai-plugin.json' && req.get?
      manifest = File.read('ai-plugin.json')
      [200, { 'Content-Type' => 'application/json' }, [manifest]]
    elsif req.path_info == '/openapi.yaml' && req.get?
      content = File.read('openapi.yaml')
      [200, { 'Content-Type' => 'application/json' }, [content]]
    elsif req.path_info == '/.well-known/ai-plugin.json' && req.options?
      [200, { 'Allow' => 'GET, OPTIONS' }, []]
    elsif req.path_info == '/logo.png' && req.get?
      logo = File.open('logo.png', 'rb')
      [200, { 'Content-Type' => 'image/png' }, logo]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end
end

run BashPlugin.new
