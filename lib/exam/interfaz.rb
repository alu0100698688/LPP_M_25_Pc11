require_relative "../exam.rb"
class Interfaz
   attr_reader :examen
   def initialize(examen)
      @examen = examen 
       
   end
   
   def to_s
       cadena=""
       preguntas = @examen.preguntas.sort{|p1,p2| p1<=>p2}
       for i in preguntas do
           cadena +=i.to_s
       end
       cadena
   end
       
    
    
end