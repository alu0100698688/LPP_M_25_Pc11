require "exam/version.rb"
require "exam/simpleSelection.rb"

class Examen
	attr_reader :myQuestion

	def initialize(myQuestion)
		@myQuestion = myQuestion
	end
end