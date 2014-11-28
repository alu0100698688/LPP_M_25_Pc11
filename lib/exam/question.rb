=begin 
Clase que representa una pregunta y que contiene las posibles respuestas así como la opción correcta.
Se incluye el Mixin Comparable.
=end
class Question
    include Comparable
    # Atributos que almacenarán el enunciado (ask), la dificultad (difficulty) y la opción correcta (respuestaCorrecta)
    attr_reader :ask,:difficulty,:respuestaCorrecta
    # Inicialización de la pregunta, recogiendo los atributos ask, respuestaCorrecta y difficulty (por defecto 0).
    def initialize(ask,respuestaCorrecta,difficulty=0)
        @ask,@respuestaCorrecta,@difficulty = ask,respuestaCorrecta,difficulty
    end 
=begin 
Método que hace la comparativa entre preguntas en función de su dificultad y sólo si la pasada por 
parámetro es también una Question
=end
    def <=> (other)
       return nil unless other.is_a?Question
       @difficulty <=> other.difficulty
    end
=begin 
Método que invalida el == y lo ajusta en el caso de que se den dos preguntas con la misma dificultad
donde entonces se determinará que realmente son iguales si tienen además el mismo enunciado (ask).
=end
    def == (other)
        return nil unless other.is_a?Question
        iguales = false
        if (self.difficulty == other.difficulty)  && (self.ask == other.ask)
            iguales = true
        end
        iguales
    end
    
end