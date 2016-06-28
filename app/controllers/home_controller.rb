require 'mailgun'

class HomeController < ApplicationController
  def index
  end
  
  def write
    #이메일 전송 관련 내용
    @email = params[:email_name_yh]
    @title = params[:title_name_yh]
    @content = params[:content_name_yh]
  
     mg_client = Mailgun::Client.new("key-secret")
    
    message_params =  {
                       from: @email,
                       to:   'example@gmail.com',
                       subject: @title,
                       text:    @content
                      }
    
    result = mg_client.send_message('seret', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  
    redirect_to "/home/index"
  end
end
