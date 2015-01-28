get '/comment/new' do
  erb :'/comment/new'
end

post '/comment/new', auth: :user do
  params[:comment][:commentor] = current_user
  comment = Comment.new(params[:comment])
  unless comment.save
    set_error!("Something went wrong while saving your comment. Please try again.")
  end
end
