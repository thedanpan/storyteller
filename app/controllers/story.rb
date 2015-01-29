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

get '/story/:id/edit' do |id|
  story = Story.find(id)
  genres = Genre.all
  if author?(story)
    erb :'stories/edit', locals: {story: story, genres: genres}
  else
    set_error!("Sorry, you don't have permission to edit this story.")
    redirect '/'
  end
end

put '/story/:id/edit' do |id|
  story = Story.find(id)
  story.update(
    title: params[:story][:title],
    content: params[:story][:content],
    fiction: params[:story][:fiction],
    genre: Genre.find_by(name: params[:story][:genre_name]) )
  redirect "/story/#{story.id}"
end

get '/story/all/user' do
  stories = Story.all
  erb :'stories/user', locals: {stories: stories}
end

delete '/story/:id' do |id|
  story = Story.find(id)
  if author?(story)
    story.destroy
  else
    set_error!("Sorry, you don't have permission to delete this story.")
  end
  redirect '/story/all'
end
