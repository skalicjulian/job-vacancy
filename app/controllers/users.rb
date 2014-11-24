JobVacancy::App.controllers :users do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  # get :new, :map => '/register' do
  #   @user = User.new
  #   render 'users/new'
  # end

  get :new_applicant, :map => '/register_app' do
    @user = User.new_applicant
    render 'users/new_applicant'
  end

  get :new_offerer, :map => '/register_off' do
    @user = User.new_offerer
    render 'users/new_offerer'
  end

  # post :create do
  #   password_confirmation = params[:user][:password_confirmation]
  #   params[:user].reject!{|k,v| k == 'password_confirmation'}
  #   if (params[:user][:password] == password_confirmation)
  #     @user = User.new(params[:user])
  #     if @user.save
  #       flash[:success] = 'User created'
  #       redirect '/'
  #     else
  #       flash.now[:error] = 'All fields are mandatory'
  #       render 'users/new'
  #     end
  #   else
  #     @user = User.new(params[:user])
  #     flash.now[:error] = 'Passwords do not match'
  #     render 'users/new'
  #   end
  # end

  post :create_applicant do
    password_confirmation = params[:user][:password_confirmation]
    params[:user].reject!{|k,v| k == 'password_confirmation'}
      if (params[:user][:password] == password_confirmation)
        if User.valid_email?(params[:user][:email])
          if User.already_in_use?(params[:user][:email])
            flash[:warning] = 'Email already in use'
            render 'users/new_applicant'
          else
            @user = User.generate_applicant(params[:user])
            if @user.save
              flash[:success] = 'User created. Now you can look for a job!'
              redirect '/'
            else
              flash.now[:error] = 'All fields are mandatory'
              render 'users/new_applicant'
            end
          end
        else
          @user = User.new(params[:user])
          flash[:error] = 'Invalid email address'
        end
      else
        @user = User.new(params[:user])
        flash.now[:error] = 'Passwords do not match'
        render 'users/new_applicant'
      end
  end

  post :create_offerer do
    password_confirmation = params[:user][:password_confirmation]
    params[:user].reject!{|k,v| k == 'password_confirmation'}
      if (params[:user][:password] == password_confirmation)
        if User.valid_email?(params[:user][:email])
          if User.already_in_use?(params[:user][:email])
            flash[:warning] = 'Email already in use'
            render 'users/new_offerer'
          else
            @user = User.generate_offerer(params[:user])
            if @user.save
              flash[:success] = 'User created. Now you can offer a job!'
              redirect '/'
            else
              flash.now[:error] = 'All fields are mandatory'
              render 'users/new_offerer'
            end
          end
        else
          flash[:error] = 'Invalid email address'
        end
      else
        flash.now[:error] = 'Passwords do not match'
        render 'users/new_offerer'
      end
  end

  get :profile_app, :map => '/profile_app' do
    @user = session[:current_user]
    render 'users/profile_applicant'
  end

  get :profile_off, :map => '/profile_off' do
    @user = session[:current_user]
    render 'users/profile_offerer'
  end

end
