require "exam/version"
require "exam/simpleSelection.rb"
require "exam/list.rb"
require "exam/verdaderoFalso.rb"

module Exam
  class Examen
     
     def initialize (listaPreguntas)
        @preguntas = listaPreguntas 
     end
     
     def insertQuestion(question)
        nodoNuevo = Node.new(question,nil,@preguntas.cola)
        nodoInsertado = @preguntas.insert(nodoNuevo)
        nodoInsertado.value
     end
      
  end    
end
