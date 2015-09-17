get '/:type/:id/upvote' do

  if params[:type] == 'questions'
    type = "Question"
  elsif params[:type] == 'answers'
    type = "Answer"
  else
    type = "Comment"
  end
  
  if current_vote(params[:id], type)
    current_vote(params[:id], type).destroy
  end

  vote = Vote.create(user_id: current_user.id, upvote: true, voteable_id: params[:id], voteable_type: type)
  redirect "/questions/#{session[:question_id]}"
end

get '/:type/:id/downvote' do
  if params[:type] == 'questions'
    type = "Question"
  elsif params[:type] == 'answers'
    type = "Answer"
  else
    type = "Comment"
  end
  
  if current_vote(params[:id], type)
    current_vote(params[:id], type).destroy
  end

  Vote.create(user_id: current_user.id, upvote: false, voteable_id: params[:id], voteable_type: type)

  redirect "/#{params[:type]}/#{params[:id]}"
end

delete '/:type/:id/deletevote' do
  if params[:type] == 'questions'
    vote = Vote.find_by(user_id: current_user.id, voteable_id: params[:id], voteable_type: "Question")
  elsif params[:type] == 'answers'
    vote = Vote.create(user_id: current_user.id, voteable_id: params[:id], voteable_type: "Answer")
  else
    vote = Vote.create(user_id: current_user.id, voteable_id: params[:id], voteable_type: "Comment")
  end
  vote.destroy
  redirect "/#{params[:type]}/#{params[:id]}"
end