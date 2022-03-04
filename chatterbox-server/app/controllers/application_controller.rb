class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    messages = Message.all
    messages.to_json
    # Message.all.to_json
  end
  
  post '/messages' do
    msg = Message.create(
      body: params[:body],
      username: params[:name]
      )
    msg.to_json
    # Message.create( body: params[:body], username: params[:name]).to_json
  end

  delete '/messages/:id' do
    msg = Message.find(params[:id])
    msg.destroy
    msg.to_json
  end

  patch '/messages/:id' do
    msg = Message.find(params[:id])
    msg.update(
      body: params[:body],
    )
    msg.to_json
  end

  
end
