def set_error!(error_msg)
  session[:error] = error_msg
end

def display_error!
  error = session[:error]
  session[:error] = nil
  error
end
