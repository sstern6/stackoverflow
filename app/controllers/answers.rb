#show all answers
get '/questions/:id/answers' do
	redirect '/questions/:id'
end

#show new answer form
get '/answers/new' do
end

#create answer
post '/answers' do
	@answer = Answer.create(content: params[:content])
end

#show answer with :id
get '/answers/:id' do
end

#show edit form for answer with :id
get '/answers/:id/edit' do
end

#update subject with :id
put '/answers/:id' do
end

#show delete form for answer with :id
get '/answers/:id/delete' do
	@answer = Answer.find(params[:id])
	@answer.destroy
end

#delete answer with :id
delete '/answers/id' do
end