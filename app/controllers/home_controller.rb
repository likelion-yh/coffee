require 'mailgun'

class HomeController < ApplicationController
  def index
  end
  
  def write
    #이메일 전송 관련 내용
    @email = params[:email_name_yh]
    @title = params[:title_name_yh]
    @content = params[:content_name_yh]
  
     mg_client = Mailgun::Client.new("key-3a2b300ef3f2c97d35cc2d721282da42")
    
    message_params =  {
                       from: @email,
                       to:   'buddhasheep@gmail.com',
                       subject: @title,
                       text:    @content
                      }
    
    result = mg_client.send_message('sandbox0073e4d78090430b9d67139acd12add9.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  
    redirect_to "/home/index"
  end
end
