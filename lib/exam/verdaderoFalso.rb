class VerdaderoFalso < SimpleSelection
    OPCIONES = {
        "a" => "Cierto",
        "b" => "Falso"
    }
    def initialize (enunciado)
       super(enunciado,OPCIONES) 
    end

end