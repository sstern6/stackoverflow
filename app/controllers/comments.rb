#show all comments
get '/comments' do
	@all_comments = Comment.all
	erb :comment
end

#show new comment form
get '/comments/new' do
end

#create comment
post '/comments' do
	@comment = Comment.create(content: params[:content])
end

#show comment with :id
get '/comments/:id' do
end

#show edit form for comment with :id
get '/comments/:id/edit' do
end

#update subject with :id
put '/comments/:id' do
end

#show delete form for comment with :id
get '/comments/:id/delete' do
	@comment = Comment.find(params[:id])
	@comment.destroy
end

#delete comment with :id
delete '/comments/id' do
end