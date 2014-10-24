class SimpleSelection
	attr_reader :ask,:answers

	def initialize(ask, answers)
		@ask = ask
		@answers = answers
	end

	def answers_to_s
		"a) #{@answers[0]}\nb) #{@answers[1]}\nc) #{@answers[2]}\nd) #{@answers[3]}\n"
	end
end