require 'sinatra'
require 'cml'
require 'json'

post '/cml/parse/' do
    { :html => handle_case }.to_json
end

def handle_case
    request.body.rewind
    request_payload = JSON.parse request.body.read
    cml = request_payload['cml']
    judgment_data = request_payload['data']
    unit_id = request_payload['unit_id']
    parser = CML::Parser.new(cml, { show_data: true })
    html = parser.to_html({ show_data: true, data: judgment_data, prefix: unit_id })
    html.gsub!(/validates-required/, "")
    
    return html
end    
        