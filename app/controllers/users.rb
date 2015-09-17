get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  p @user
  old_password = params[:password_old]
  p old_password
  if @user.password == old_password
    @user.update_attributes(params[:user])
    redirect "/users/#{@user.id}"
  else
    @error_message = true
    erb :'/users/edit'
  end
end

get '/users/:id/delete' do
  @user = User.find(params[:id])
  @user.destroy
  session.delete(:user_id)
  redirect '/'
end