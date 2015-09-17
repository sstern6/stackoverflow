helpers do 

  def current_vote(voteableid, votabletype) 
    Vote.find_by(user_id: current_user.id, voteable_id: voteableid, voteable_type: votabletype)
  end
  
end