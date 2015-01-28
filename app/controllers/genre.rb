get '/genre/all' do
  genres = Genre.all
  erb :'genres/all', locals: {genres: genres}
end
