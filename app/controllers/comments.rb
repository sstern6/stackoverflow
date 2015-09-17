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
	if session[:user_id]
		case session[:commentable_type]
		when "Question"
			Comment.create(user_id: session[:user_id], content: params[:content], commentable_id: session[:question_id], commentable_type: session[:commentable_type])
		when "Answer"
			Comment.create(user_id: session[:user_id], content: params[:content], commentable_id: session[:answer_id], commentable_type: session[:commentable_type])
		end
	end
	redirect "/questions/" + session[:question_id].to_s
end

#show comment with :id
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
delete '/comments/id' do
end