get '/genre/all' do
  genres = Genre.all
  erb :'genres/all', locals: {genres: genres}
end


get '/genre/:id' do |id|
  genre = Genre.find(id)
  erb :'genres/show', locals: {genre: genre}
end
