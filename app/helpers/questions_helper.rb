def get_question
	@question = Question.find(params[:id])
end