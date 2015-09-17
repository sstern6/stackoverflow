#show all comments
get '/comments' do
	@all_comments = Comment.all
	erb :comment
end

#show new comment form
get '/comments/questions/new' do
	session[:commentable_type] = "Question"
 	erb :comment_form
end

get '/comments/answers/:id/new' do
	session[:answer_id] = params[:id]
	session[:commentable_type] = "Answer"
 	erb :comment_form
end

#create comment
post '/comments' do

	user = User.find(current_user)

	comment = Comment.create(
			content: params[:content],
			question_id: params[:question_id],
			user_id: user.id
			)

	if request.xhr?

		# {content: params[:content], id: comment.id}.to_json

	end

end

# show comment with :id
get '/comments/:id' do
	@comment = Comment.find(params[:id])
	redirect "/questions/#{@comment.question_id}"
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
delete '/comments/:id' do
end
