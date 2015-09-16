require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

users = 100.times.map do 
	User.create!(:username => Faker::Name.name,
				 :email => Faker::Internet.safe_email,
				 :password_hash => 'password')
end

Question.create!(:id => 1, :user_id => 3, :content => "This is a first question content.", :title => "This is the First Question Title")
Question.create!(:id => 2, :user_id => 4, :content => "This is a second question content.", :title => "This is the Second Question Title")
Question.create!(:id => 3, :user_id => 5, :content => "This is a third question content.", :title => "This is the Third Question Title")

Answer.create!(:id => 1, :user_id => 1, :question_id => 1, :content => "This is the first answer to a question.")
Answer.create!(:id => 2, :user_id => 3, :question_id => 2, :content => "This is the second to a question.")
Answer.create!(:id => 3, :user_id => 5, :question_id => 2, :content => "This is the third to a question.")

Comment.create!(:id => 1, :user_id => 1, :commentable_id => 2, :commentable_type => "Question", :content => "This is a comment.")
Comment.create!(:id => 2, :user_id => 5, :commentable_id => 2, :commentable_type => "Question", :content => "This is a comment.")
Comment.create!(:id => 3, :user_id => 3, :commentable_id => 3, :commentable_type => "Answer", :content => "This is a comment.")
Comment.create!(:id => 4, :user_id => 2, :commentable_id => 3, :commentable_type => "Answer", :content => "This is a comment.")
Comment.create!(:id => 5, :user_id => 1, :commentable_id => 1, :commentable_type => "Answer", :content => "This is a comment.")
Comment.create!(:id => 6, :user_id => 3, :commentable_id => 2, :commentable_type => "Answer", :content => "This is a comment.")

# users.each do |user|
# 	question = user.question.create(:content => "This is a question.", :title => "This is a Question Title")
# 	answer = question.answers.create(:content => "This is an answer to a question.")
# 	question.comments.create()
# 	anaswer.comments.create()
# end

Vote.create!(:id => 1, :user_id => 1, :upvote => true, :voteable_id => 2, :voteable_type => "Comment")
Vote.create!(:id => 2, :user_id => 1, :upvote => true, :voteable_id => 3, :voteable_type => "Comment")
Vote.create!(:id => 3, :user_id => 1, :upvote => true, :voteable_id => 4, :voteable_type => "Comment")
Vote.create!(:id => 4, :user_id => 1, :upvote => true, :voteable_id => 5, :voteable_type => "Comment")
Vote.create!(:id => 5, :user_id => 1, :upvote => true, :voteable_id => 6, :voteable_type => "Comment")
Vote.create!(:id => 6, :user_id => 2, :upvote => true, :voteable_id => 2, :voteable_type => "Answer")
Vote.create!(:id => 7, :user_id => 2, :upvote => false, :voteable_id => 3, :voteable_type => "Answer")
Vote.create!(:id => 8, :user_id => 3, :upvote => true, :voteable_id => 1, :voteable_type => "Answer")
Vote.create!(:id => 9, :user_id => 3, :upvote => true, :voteable_id => 3, :voteable_type => "Answer")
Vote.create!(:id => 10, :user_id => 11, :upvote => true, :voteable_id => 1, :voteable_type => "Question")
Vote.create!(:id => 11, :user_id => 13, :upvote => true, :voteable_id => 1, :voteable_type => "Question")
Vote.create!(:id => 12, :user_id => 15, :upvote => true, :voteable_id => 1, :voteable_type => "Question")
Vote.create!(:id => 13, :user_id => 17, :upvote => true, :voteable_id => 1, :voteable_type => "Question")
Vote.create!(:id => 14, :user_id => 19, :upvote => false, :voteable_id => 1, :voteable_type => "Question")
Vote.create!(:id => 15, :user_id => 21, :upvote => false, :voteable_id => 1, :voteable_type => "Question")