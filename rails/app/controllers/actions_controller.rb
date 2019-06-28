class ActionsController < ApplicationController
  def index
    if (params[:switch] == nil)
      @switch = false
    else
      @switch = true
    end
    
    if (params[:sms] == nil)
      @sms = false
    else
      @sms = true
    end
    
    if (params[:mail] == nil)
      @mail = false
    else
      @mail = true
    end

    @pt = params[:post_num].to_i

    Subscribe.all.each do |x|
      if ((x.user_id == current_user.id) && (x.post_id == @pt))
        Subscribe.update(post_id: "#{@pt}", user_id: "#{params[:user_id]}", switch: @switch, keyword_1: "#{params[:keyword_1]}", keyword_2: "#{params[:keyword_2]}", sms: @sms, mail: params[:mail])
      else
        Subscribe.create(post_id: "#{@pt}", user_id: "#{params[:user_id]}", switch: @switch, keyword_1: "#{params[:keyword_1]}", keyword_2: "#{params[:keyword_2]}", sms: @sms, mail: params[:mail])
      end
    end
    
    redirect_to request.referrer
  end
end
