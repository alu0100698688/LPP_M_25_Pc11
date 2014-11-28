# Clase que hereda de Question y que permite crear preguntas del tipo Verdadero o Falso.
class VerdaderoFalso < Question
    # Constante que tiene las dos únicas opciones que puede tener este tipo de pregunta (Cierto y Falso)
    OPCIONES = {
        "a" => "Cierto",
        "b" => "Falso"
    }
    # Inicialización de los atributos mediante una llamada al constructor de la clase madre.
    def initialize (ask,respuestaCorrecta,difficulty=0)
       super(ask,respuestaCorrecta,difficulty) 
    end
    # Método que devuelve una cadena con el enunciado y las dos posibles opciones de respuesta para la pregunta.
    def to_s 
        cadena = @ask + "\n"
        OPCIONES.each do |m,i|
            cadena += "#{m})#{i}\n"
        end
        cadena
    end

end