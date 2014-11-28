require_relative "exam/version"
require_relative "exam/simpleSelection.rb"
require_relative "exam/list.rb"
require_relative "exam/verdaderoFalso.rb"
# Módulo que contiene la clase Examen.
module Exam
  # Esta clase permite crear un examen donde se almacenan preguntas.
  class Examen
     # Atributo que almacena un listado de preguntas para el examen
     attr_reader :preguntas
     # Inicialización del conjunto de preguntas del examen.
     def initialize (listaPreguntas)
        @preguntas = listaPreguntas 
     end
     # Método que permite la inserción de una pregunta en el listado del examen
     def insertQuestion(question)
        nodoNuevo = Node.new(question,nil,@preguntas.cola)
        nodoInsertado = @preguntas.insert(nodoNuevo)
        nodoInsertado.value
     end
     # Método que devuelve una cadena con las preguntas del examen
     def to_s 
       cadena =""
       for i in @preguntas do
          cadena +=i.to_s
       end
       cadena
     end
    
      
  end    
end
