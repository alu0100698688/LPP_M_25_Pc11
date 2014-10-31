require "lib/exam.rb"

describe Exam do

  before :each do
    @options1 = {
      "a" => "azul",
      "b" => "verde",
      "c" => "negro",
      "d" => "naranja"
    }
    @options2 = {
      "a" => "Un ave",
      "b" => "Un reptil",
      "c" => "Un mamifero",
      "d" => "Ninguna de las anteriores"
    }
    @sS1 = SimpleSelection.new("¿De qué color es el coche del presidente?",@options1)
    @sS2 = SimpleSelection.new("¿Que es un perro?",@options2)
    @questions =[@sS1,@sS2] 
    #Listas enlazadas
    @nodo1 = Node.new
    @nodo1[:value] = 2
    @nodo1[:next] = nil
    @nodo2 = Node.new
    @nodo2[:value] = 5
    @nodo2[:next] = nil
    @arrayNodos = [@nodo1,@nodo2]
    @nodoCabeza = Node.new
    @nodoCabeza[:value] = 3
    @nodoCabeza[:next] = nil
    @lista1 = List.new(@nodoCabeza)
  end  
  #Pruebas para las preguntas de selección simple
  describe "# Almacenamiento de la pregunta." do

    it "Se almacena correctamente la pregunta." do
        @sS1.ask.should eq("¿De qué color es el coche del presidente?")
    end

    it "Se almacenan correctamente las respuestas." do
        @sS1.answers_to_s.should eq("a)azul\nb)verde\nc)negro\nd)naranja\n")
    end
  end
  describe "# Obtencion respuestas" do
    it "Hash de opciones" do
      @sS1.answers.should eq({"a"=>"azul", "b"=>"verde", "c"=>"negro", "d"=>"naranja"})
    end
  end 
  describe "#Mostrar preguntas y respuestas" do
    it "Mostrar una pregunta y su respuesta" do
       @sS1.to_s.should eq("¿De qué color es el coche del presidente?\na)azul\nb)verde\nc)negro\nd)naranja\n")
    end  
    
  end
  #Prueba de las preguntas de la práctica 6
  describe "#Comprobación preguntas y respuestas" do
    it "#Comprobación pregunta 1" do
      enunciado = "¿Cuál es la salida del siguiente código Ruby? class Xyz\ndef pots\n@nice\nend\nend\nxyz = Xyz.new\np xyz.pots"
      opciones ={
        "a" => "#<Xyz:0xa000208>",
        "b" => "nil",
        "c" => "0",
        "d" => "Ninguna de las anteriores"
      }
      pregunta1 = SimpleSelection.new(enunciado,opciones)
      pregunta1.to_s.should eq("¿Cuál es la salida del siguiente código Ruby? class Xyz\ndef pots\n@nice\nend\nend\nxyz = Xyz.new\np xyz.pots\na)#<Xyz:0xa000208>\nb)nil\nc)0\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 2" do
      enunciado = "La siguiente definición de un hash en Ruby es válida:\n hash_raro = {\n[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
      opciones = {
        "a" => "Cierto",
        "b" => "Falso"
      }
      pregunta2 = SimpleSelection.new(enunciado,opciones)
      pregunta2.to_s.should eq ("La siguiente definición de un hash en Ruby es válida:\n hash_raro = {\n[1, 2, 3] => Object.new(),\nHash.new => :toto\n}\na)Cierto\nb)Falso\n")
    end
    it "#Comprobación pregunta 3" do
      enunciado = "¿Cuál es la salida del siguiente código Ruby?\n class Array\ndef say_hi\n\"HEY!\"\nend\nend\np [1, \"bob\"].say_hi\n"
      opciones = {
        "a" => "1",
        "b" => "bob",
        "c" => "HEY!",
        "d" => "Ninguna de las anteriores"
      }
      pregunta3 = SimpleSelection.new(enunciado,opciones)
      pregunta3.to_s.should eq ("¿Cuál es la salida del siguiente código Ruby?\n class Array\ndef say_hi\n\"HEY!\"\nend\nend\np [1, \"bob\"].say_hi\n\na)1\nb)bob\nc)HEY!\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 4" do
      enunciado = "¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n"
      opciones ={
        "a" => "Una instancia de la clase Class",
        "b" => "Una constante",
        "c" => "Un objeto",
        "d" => "Ninguna de las anteriores"
        
      }
      pregunta4 = SimpleSelection.new(enunciado,opciones)
      pregunta4.to_s.should eq("¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n\na)Una instancia de la clase Class\nb)Una constante\nc)Un objeto\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 5" do
      enunciado = "Es apropiado que una clase Tablero herede de una clase Juego\n"
      opciones ={
        "a" => "Cierto",
        "b" => "Falso"
      }
      pregunta5 = SimpleSelection.new(enunciado,opciones)
      pregunta5.to_s.should eq("Es apropiado que una clase Tablero herede de una clase Juego\n\na)Cierto\nb)Falso\n")
    end
    
  end
  #Pruebas para las listas enlazadas
  describe "#Extracción de elementos" do
    it "#Extraer el primer elemento" do
       @lista1.pullHead.should eq (nil)
    end
  end
  describe "#Inserción de elementos" do
    it "#Insertar un elemento" do
       
       nodoInsertado = @lista1.insert(@nodo1)
       nodoInsertado[:value].should eq (2)
       nodoInsertado[:next].should eq (nil)
    end
    it "#Insertar varios elementos" do
       ultimoNodoInsertado = @lista1.insertElements(@arrayNodos)
       ultimoNodoInsertado[:value].should eq(5)
       ultimoNodoInsertado[:next].should eq(nil)
    end
  end
  describe "#Recoger información nodos" do
    it "#Recoger cabeza de la cola" do
      nodoCabeza = @lista1.cabeza
      nodoCabeza[:value].should eq (3)
      nodoCabeza[:next].should eq (nil)
    end
  end
end
