get '/home', auth: :user do
    erb :'auth/home'
end
