get '/story/new' do
  genres = Genre.all
  erb :'stories/new', locals: {genres: genres}
end

# try to refactor this
post '/story/new', auth: :user do
  story = current_user.stories.create(
    title: params[:story][:title],
    content: params[:story][:content],
    fiction: params[:story][:fiction],
    genre: Genre.find_by(name: params[:story][:genre_name]) )
  redirect '/story/all/user'
end

get '/story/all' do
  stories = Story.all
  erb :'stories/all', locals: {stories: stories}
end


get '/story/:id' do |id|
  story = Story.find(id)
  erb :'stories/show', locals: {story: story}
end
