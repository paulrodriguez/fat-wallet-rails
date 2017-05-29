class IndexController < ApplicationController
  def index
    @user = User.new
  end

  def login
    if request.post?
      respond_to do |format|
        @user = User.find_by(username: login_params[:username])
        if(@user.nil?)
          @error = "Invalid Username or password"
          format.html { render :login }
          format.json { render json: {notice: 'Invalid Username or password.'}, status: :unprocessable_entity }
        else
          hashed_pass = BCrypt::Engine.hash_secret(login_params[:password], @user.salt)
          if(hashed_pass!=@user.password)
            @error = "Invalid Username or password"
            format.html { render :login }
            format.json { render json: {notice: 'Invalid Username or password.'}, status: :unprocessable_entity }
          else
            session[:user_id] = @user.id
            format.html {redirect_to :index}
            format.html {render json: {success: true}}
          end
        end
      end
    end

    #@user = User.find_by(username: login_params[:username])
  end

  def register
    @user = User.new
    if request.post?
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :register }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def about
  end

  private
    def login_params
      params.permit(:username, :password)
    end
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end
end
