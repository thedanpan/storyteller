def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def author?(story)
  story.author == current_user
end

def commentor?(comment)
  comment.commentor_id == current_user.id
end
