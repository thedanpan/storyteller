
post '/comment/new' do
  comment = Comment.create(
    content: params[:comment][:content],
    story_id: params[:comment][:story_id],
    commentor_id: params[:comment][:commentor_id]
    )
  unless comment.save
    set_error!("Something went wrong while saving your comment. Please try again.")
  end
  redirect "/story/#{comment.story_id}"
end

get '/comment/:id' do
  comment = Comment.find(id)
  erb :'comments/show', locals: {comment: comment}
end


get '/comment/:id/edit', auth: :user do |id|
  comment = Comment.find(id)
  erb :'comments/edit', locals: {comment: comment}
end


put '/comment/:id/edit', auth: :user do |id|
  comment = Comment.find(id)
  comment.update(content: params[:comment][:content])
  redirect "/story/#{comment.story_id}"
end


delete '/comment/:id', auth: :user do |id|
  comment = Comment.find(id)
  if commentor?(comment)
    comment.destroy
  else
    set_error!("Sorry, you don't have permission to delete this comment.")
  end
  redirect "/story/#{comment.story_id}"
end


