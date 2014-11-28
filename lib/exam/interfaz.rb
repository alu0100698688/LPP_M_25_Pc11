require_relative "../exam.rb"
# Clase que permite representar un examen con sus preguntas y comprobar la puntuación del mismo.
class Interfaz
   # Atributo que tendrá el examen sobre el que se realizarán las comprobaciones.
   attr_reader :examen
   # Inicialización del atributo examen.
   def initialize(examen)
      @examen = examen 
       
   end
=begin 
Método que en función de unas respuestas proporcionadas por el usuario comprueba la nota obtenida en el 
examen y se la muestra al usuario.
=end 
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
   
   # Método que devuelve una cadena con las preguntas ordenadas de menor a mayor.
   def to_s
       cadena=""
       preguntas = @examen.preguntas.sort{|p1,p2| p1<=>p2}
       for i in preguntas do
           cadena +=i.to_s
       end
       cadena
   end
       
    
    
end