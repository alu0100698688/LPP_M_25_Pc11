#encoding: UTF-8
require_relative "exam.rb"

class Main
    
     #Pregunta 1
    enunciado1 = "¿Cuál es la salida del siguiente código Ruby? class Xyz\ndef pots\n@nice\nend\nend\nxyz = Xyz.new\np xyz.pots"
      opciones1 ={
        "a" => "#<Xyz:0xa000208>",
        "b" => "nil",
        "c" => "0",
        "d" => "Ninguna de las anteriores"
      }
    
    @pregunta1 = SimpleSelection.new(enunciado1,opciones1,6)
    
    @nodoP1 = Node.new(@pregunta1,nil,nil)
    @listaPreguntas = List.new(@nodoP1)
    @examen = Exam::Examen.new(@listaPreguntas)
    #Pregunta 2
    enunciado2 = "La siguiente definición de un hash en Ruby es válida:\n hash_raro = {\n[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
    @pregunta2 = VerdaderoFalso.new(enunciado2,4)
    @examen.insertQuestion(@pregunta2)
    
    #Pregunta 3
    enunciado3 = "¿Cuál es la salida del siguiente código Ruby?\n class Array\ndef say_hi\n\"HEY!\"\nend\nend\np [1, \"bob\"].say_hi\n"
    opciones3 = {
        "a" => "1",
        "b" => "bob",
        "c" => "HEY!",
        "d" => "Ninguna de las anteriores"
    }
    @pregunta3 = SimpleSelection.new(enunciado3,opciones3,7)
    @examen.insertQuestion(@pregunta3)
    #Pregunta 4
    enunciado4 = "¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n"
      opciones4 ={
        "a" => "Una instancia de la clase Class",
        "b" => "Una constante",
        "c" => "Un objeto",
        "d" => "Ninguna de las anteriores"
        
      }
      @pregunta4 = SimpleSelection.new(enunciado4,opciones4,8)
    @examen.insertQuestion(@pregunta4)
    #Pregunta 5
    @vf1 = VerdaderoFalso.new("Es apropiado que una clase Tablero herede de una clase Juego",5)
    @examen.insertQuestion(@vf1)
    
    @listaPreguntas = @examen.preguntas.sort{|p1,p2| p1<=>p2}
    for i in @listaPreguntas do
        puts i
        puts "Introduzca una opción: "
        STDOUT.flush 
        respuesta = gets.chomp
        if i.correcta == respuesta
            puts "Respuesta Correcta"
        else
            puts "Respuesta Incorrecta"
        end
    end
    
    
    
end