class SimpleSelection
	attr_reader :ask,:answers

	def initialize(ask, answers)
		@ask = ask
		@answers = answers
	end

	
	def to_s
		"#{@ask}\n "+self.answers_to_s
	end
end