require_relative "exam/version"
require_relative "exam/simpleSelection.rb"
require_relative "exam/list.rb"
require_relative "exam/verdaderoFalso.rb"

module Exam
  class Examen
     attr_reader :preguntas
     def initialize (listaPreguntas)
        @preguntas = listaPreguntas 
     end
     
     def insertQuestion(question)
        nodoNuevo = Node.new(question,nil,@preguntas.cola)
        nodoInsertado = @preguntas.insert(nodoNuevo)
        nodoInsertado.value
     end
     
     def to_s 
       cadena =""
       for i in @preguntas do
          cadena +=i.to_s
       end
       cadena
     end
    
      
  end    
end
