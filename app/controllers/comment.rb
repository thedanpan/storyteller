get '/comment/new' do
  erb :'/comments/new'
end

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
