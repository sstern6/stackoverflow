#show all answers
get '/questions/:id/answers' do
	redirect '/questions/:id'
end

#show new answer form
get '/answers/new' do
	if is_authenticated?
		erb :answer_form
	else
		redirect "/questions/" + session[:question_id].to_s
	end
end

#create answer
post '/answers' do
	Answer.create(user_id: session[:user_id], content: params[:content], question_id: session[:question_id])
	redirect "/questions/" + session[:question_id].to_s
end

#show edit form for answer with :id
get '/answers/:id/edit' do
	@answer = Answer.find(params[:id])
	if @answer.user_id == session[:user_id]
		erb :answer_edit
	else
		redirect "/questions/#{@answer.question_id}"
	end
end

#update subject with :id
put '/answers/:id' do
	@answer = Answer.find(params[:id])
	@answer.content = params[:content] if params[:content]
	@answer.save
	redirect "/questions/" + session[:question_id].to_s
end

#delete answer with :id
delete '/answers/:id' do
	@answer = Answer.find(params[:id])
	question_id = @answer.question_id
	if @answer.user_id == session[:user_id]
		@answer.destroy
		redirect "/questions/#{question_id}"
	else
		redirect "/questions/#{question_id}"
	end
end

# #show answer with :id
get '/answers/:id' do
	@answer = Answer.find(params[:id])
	redirect "/questions/#{@answer.question_id}"
end