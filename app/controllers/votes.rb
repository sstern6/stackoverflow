# get '/:type/:id/upvote' do
post '/questions/:id/vote' do

  answer = Answer.find(params[:id])
  Vote.create(user_id: current_user.id, upvote: true, voteable_id: params[:id], voteable_type: "Answer")

end


