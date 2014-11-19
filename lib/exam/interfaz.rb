require_relative "../exam.rb"
class Interfaz
   attr_reader :examen
   def initialize(examen)
      @examen = examen 
       
   end
   
   def compararRespuestas(respuestasUsuario)
      iterador =0
      respuestasCorrectas = 0
      
      for i in @examen.preguntas do
          if i.respuestaCorrecta == respuestasUsuario[iterador]
             respuestasCorrectas += 1 
          end
          iterador +=1
      end
      if respuestasCorrectas < (iterador/2)+1
          mensaje = "Ha suspendido el examen: #{respuestasCorrectas}/#{iterador}"
      else
          if respuestasCorrectas == iterador
              mensaje = "Su nota es: Sobresaliente 10"
          else
              mensaje = "Ha aprobado el examen: #{respuestasCorrectas}/#{iterador}"
          end
      end
      mensaje
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