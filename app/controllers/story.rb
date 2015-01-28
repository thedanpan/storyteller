get '/story/all' do
  stories = Story.all
  erb :'stories/all', locals: {stories: stories}
end


get '/story/:id' do |id|
  story = Story.find(id)
  erb :'stories/show', locals: {story: story}
end
