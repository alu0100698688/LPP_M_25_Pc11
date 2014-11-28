require_relative "../exam/question.rb"
# Clase que hereda de Question y que permitirá crear preguntas con muchas opciones de respuesta.
class SimpleSelection < Question
	# Atributo que almacenará las opciones de respuesta para la pregunta.
	attr_reader :answers
=begin
Inicialización de las variables ask, answers, respuestaCorrecta y difficulty. Ésta última con valor por
defecto a 0. Para inicializar se llamará al método super que mandará la información al constructor
de la clase madre (Question).
=end
	def initialize(ask, answers,respuestaCorrecta,difficulty=0)
		super(ask,respuestaCorrecta,difficulty)
		@answers = answers
	end
	# Método que devuelve una cadena con las opciones de respuesta de la pregunta.
	def answers_to_s
		cadena = ""
		@answers.each do |m,i| 
       		cadena += "#{m})#{i}\n"
      	end
      	cadena
	end
	# Método que devuelve una cadena con el enunciado y las opciones de respuesta de la pregunta.
	def to_s
		cadena = "#{@ask}\n"
		cadena +=self.answers_to_s
		cadena
	end
end