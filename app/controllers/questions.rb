#show all questions
get '/questions' do
	@all_questions = Question.all
	erb :question
end

#show new question form
get '/questions/new' do
end

#create question
post '/questions' do
end

#show question with :id
get '/questions/:id' do
end

#show edit form for question with :id
get '/questions/:id/edit' do
end

#update subject with :id
put '/questions/:id' do
end

#show delete form for question with :id
get '/questions/:id/delete' do
	@question = Question.find(params[:id])
	@question.destroy
end

#delete question with :id
delete '/questions/id' do
end

