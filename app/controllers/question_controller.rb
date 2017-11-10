class QuestionController < ApplicationController
  def index
    @questions = Question.all
    
  end

  def show
    # @option = params[:option]
    # @name = params[:name]
    # @content = params[:content]
    
    # if @option == "공개"
    #   Question.create(
    #     name: @name,
    #     content: @content
    #     )
    # else
    #   @name = "익명"
    #   Question.create(
    #     name: @name,
    #     content: @content
    #     )
    # end
    @name = params[:name]
    @content = params[:content]
    
    Question.create(
      name: @name,
      content: @content
      )
      
    redirect_to :back #이전 페이지로 돌아감
  end
  
  def sign_up
    
  end
  
  def sign_up_process
    @email =params[:email]
    @name =params[:name]
    @password =params[:password]
    
    
    User.create(
      email: @email,
      name: @name,
      password: @password
      )
    
  end
  
  def login
    
  end
  
  def login_process
    @email = params[:email]
    @password = params[:password]
    @message = ""
    
    #유저인증
    user = User.find_by(email: @email)
    
    if user
      if user.password == @password
        session[:user_email] = user.email
        redirect_to '/'
      else
        @message = "비밀번호가 잘못되었습니다."
      end
    else
      @message = "가입이 안되어 있거나, 메일주소가 잘못되었습니다."
    end
    
  end
  
  
  def logout
    session.clear
    redirect_to '/'
  end
  
end
