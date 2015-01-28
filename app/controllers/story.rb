get '/story/all' do
  stories = Story.all
  erb :'stories/all', locals: {stories: stories}
end
