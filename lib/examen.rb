require "exam/version.rb"
require "exam/simpleSelection.rb"

class Examen
	attr_reader :myQuestion

	def initialize(myQuestion)
		@myQuestion = myQuestion
	end
	def to_s
		@questions = ""
		for i in (0...@myQuestion.length)
            @questions += @myQuestion[i].to_s
        end
        return @questions
	end
end