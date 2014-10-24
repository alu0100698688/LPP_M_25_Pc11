class SimpleSelection
	attr_reader :ask,:answers

	def initialize(ask, answers)
		@ask = ask
		@answers = answers
	end

	def answers_to_s
		"a)#{@answers[0]}\n b)#{@answers[1]}\n c)#{@answers[2]}\n d)#{@answers[3]}\n"
	end
	def to_s
		"#{@ask}\n "+self.answers_to_s
	end
end