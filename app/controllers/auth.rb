get '/' do
  if current_user
    redirect '/home'
  else
    erb :welcome
  end
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect '/home'
  else
    set_error!("The username or password is incorrect.")
    redirect '/login'
  end
end



get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    set_error!("Sorry, looks like something went wrong. The new user was not saved. Please try again.")
    redirect '/signup'
  end
end



get '/logout' do
  session[:user_id] = nil
  redirect '/'
end