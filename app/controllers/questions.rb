#show all questions
get '/questions' do
	@all_questions = Question.all
	erb :question
end

#show new question form
get '/questions/new' do
	erb :question_form
end

#create question
post '/questions' do
	Question.create(user_id: session[:user_id], title: params[:title], content: params[:content])
	redirect '/questions'
end

#show question with :id
get '/questions/:id' do
	get_question	
	@all_answers = @question.answers.all
	session[:question_id] = @question.id
	erb :answer
end

#show edit form for question with :id
get '/questions/:id/edit' do
	get_question
	if @question.user_id == session[:user_id]
		erb :question_edit
	else
		redirect "/questions/#{@question.id}" 
	end
end

#update subject with :id
put '/questions/:id' do
	get_question
	@question.title = params[:title] if params[:title]
	@question.content = params[:content] if params[:content]
	@question.save
	redirect '/questions'
end

#delete question with :id
delete '/questions/:id' do
	get_question
	if @question.user_id == session[:user_id]
		@question.destroy
		redirect "/questions" 
	else
		redirect "/questions/#{@question.id}" 
	end
	redirect '/questions'
end