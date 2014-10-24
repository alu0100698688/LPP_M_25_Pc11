class SimpleSelection
	attr_reader :ask, :answer

	def initialize(ask, answer)
		@ask = ask
		@answer = answer
	end

	def answer
		"a) #{@answer[0]}\nb) #{@answer[1]}\nc) #{@answer[2]}\nd) #{@answer[3]}\n"
	end
end