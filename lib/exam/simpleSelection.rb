require_relative "../exam/question.rb"
class SimpleSelection < Question
	attr_reader :answers

	def initialize(ask, answers,respuestaCorrecta,difficulty=0)
		super(ask,respuestaCorrecta,difficulty)
		@answers = answers
	end

	def answers_to_s
		cadena = ""
		@answers.each do |m,i| 
       		cadena += "#{m})#{i}\n"
      	end
      	cadena
	end
	def to_s
		cadena = "#{@ask}\n"
		cadena +=self.answers_to_s
		cadena
	end
end