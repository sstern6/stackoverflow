post '/:type/:id/upvote' do
  if params[:type] == 'questions'
    current_vote(params[:id], "Question").destroy
    vote = Vote.create(user_id: current_user.id, upvote: true, voteable_id: params[:id], voteable_type: "Question")
  elsif params[:type] == 'answers'
    current_vote(params[:id], "Answer").destroy
    vote = Vote.create(user_id: current_user.id, upvote: true, voteable_id: params[:id], voteable_type: "Answer")
  else
    current_vote(params[:id], "Comment").destroy
    vote = Vote.create(user_id: current_user.id, upvote: true, voteable_id: params[:id], voteable_type: "Comment")
  end
  redirect "/#{params[:type]}/#{params[:id]}"
end

post '/:type/:id/downvote' do
  if params[:type] == 'questions'
    current_vote(params[:id], "Question").destroy
    vote = Vote.create(user_id: current_user.id, upvote: false, voteable_id: params[:id], voteable_type: "Question")
  elsif params[:type] == 'answers'
    current_vote(params[:id], "Answer").destroy
    vote = Vote.create(user_id: current_user.id, upvote: false, voteable_id: params[:id], voteable_type: "Answer")
  else
    current_vote(params[:id], "Comment").destroy
    vote = Vote.create(user_id: current_user.id, upvote: false, voteable_id: params[:id], voteable_type: "Comment")
  end
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