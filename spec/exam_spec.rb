require_relative "../lib/exam.rb"

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
    
    #Listas enlazadas
    @nodo1 = Node.new(2,nil,nil)
    @nodo2 = Node.new(5,nil,nil)
    @arrayNodos = [@nodo1,@nodo2]
    @nodoCabeza = Node.new(3,nil,nil)
    @lista1 = List.new(@nodoCabeza)
    #Preguntas para las pruebas de la práctica 6
    @difficulty = 6
    #Pregunta 1
    enunciado1 = "¿Cuál es la salida del siguiente código Ruby? class Xyz\ndef pots\n@nice\nend\nend\nxyz = Xyz.new\np xyz.pots"
      opciones1 ={
        "a" => "#<Xyz:0xa000208>",
        "b" => "nil",
        "c" => "0",
        "d" => "Ninguna de las anteriores"
      }
    
    @pregunta1 = SimpleSelection.new(enunciado1,opciones1,@difficulty)
    
    @nodoP1 = Node.new(@pregunta1,@nodoP2,nil)
    #Pregunta 2
    enunciado2 = "La siguiente definición de un hash en Ruby es válida:\n hash_raro = {\n[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
    @pregunta2 = VerdaderoFalso.new(enunciado2)
    @nodoP2 = Node.new(@pregunta2,@nodoP3,@nodoP1)
    #Pregunta 3
    enunciado3 = "¿Cuál es la salida del siguiente código Ruby?\n class Array\ndef say_hi\n\"HEY!\"\nend\nend\np [1, \"bob\"].say_hi\n"
    opciones3 = {
        "a" => "1",
        "b" => "bob",
        "c" => "HEY!",
        "d" => "Ninguna de las anteriores"
    }
    @pregunta3 = SimpleSelection.new(enunciado3,opciones3)
    @nodoP3 = Node.new(@pregunta3,@nodoP4,@nodoP2)
    #Pregunta 4
    enunciado4 = "¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n"
      opciones4 ={
        "a" => "Una instancia de la clase Class",
        "b" => "Una constante",
        "c" => "Un objeto",
        "d" => "Ninguna de las anteriores"
        
      }
      @pregunta4 = SimpleSelection.new(enunciado4,opciones4)
      @nodoP4 = Node.new(@pregunta4,@nodoP5,@nodoP3)
    #Pregunta 5
    @vf1 = VerdaderoFalso.new("Es apropiado que una clase Tablero herede de una clase Juego")
    @nodoP5 = Node.new(@vf1,nil,@nodoP4)
    @arrayNodosPreguntas = [@nodoP1,@nodoP2,@nodoP3,@nodoP4,@nodoP5]
  end  
  #Pruebas para las preguntas de selección simple
  describe "#Comprobación jerarquía" do
      it "#SimpleSelection es Question" do
          expect(@sS1.is_a?Question).to eq(true)
      end
      it "#VerdaderoFalso es Question" do
          expect(@vf1.is_a?Question).to eq(true)
      end
  end
  describe "# Almacenamiento de la pregunta." do

    it "Se almacena correctamente la pregunta." do
        expect(@sS1.ask).to eq("¿De qué color es el coche del presidente?")
    end

    it "Se almacenan correctamente las respuestas." do
        expect(@sS1.answers_to_s).to eq("a)azul\nb)verde\nc)negro\nd)naranja\n")
    end
  end
  describe "# Obtencion respuestas" do
    it "Hash de opciones" do
      expect(@sS1.answers).to eq({"a"=>"azul", "b"=>"verde", "c"=>"negro", "d"=>"naranja"})
    end
  end 
  describe "#Mostrar preguntas y respuestas" do
    it "Mostrar una pregunta y su respuesta" do
       expect(@sS1.to_s).to eq("¿De qué color es el coche del presidente?\na)azul\nb)verde\nc)negro\nd)naranja\n")
    end  
    
  end
  #Prueba de las preguntas de la práctica 6
  describe "#Comprobación preguntas y respuestas" do
    it "#Comprobación pregunta 1" do
      
      expect(@pregunta1.to_s).to eq("¿Cuál es la salida del siguiente código Ruby? class Xyz\ndef pots\n@nice\nend\nend\nxyz = Xyz.new\np xyz.pots\na)#<Xyz:0xa000208>\nb)nil\nc)0\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 2" do
      
      expect(@pregunta2.to_s).to eq ("La siguiente definición de un hash en Ruby es válida:\n hash_raro = {\n[1, 2, 3] => Object.new(),\nHash.new => :toto\n}\na)Cierto\nb)Falso\n")
    end
    it "#Comprobación pregunta 3" do
      
      expect(@pregunta3.to_s).to eq ("¿Cuál es la salida del siguiente código Ruby?\n class Array\ndef say_hi\n\"HEY!\"\nend\nend\np [1, \"bob\"].say_hi\n\na)1\nb)bob\nc)HEY!\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 4" do
      
      expect(@pregunta4.to_s).to eq("¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n\na)Una instancia de la clase Class\nb)Una constante\nc)Un objeto\nd)Ninguna de las anteriores\n")
    end
    it "#Comprobación pregunta 5" do
      
      expect(@vf1.to_s).to eq("Es apropiado que una clase Tablero herede de una clase Juego\na)Cierto\nb)Falso\n")
    end
    
  end
  #Pruebas para las listas enlazadas
  describe "#Extracción de elementos" do
    it "#Extraer el primer elemento" do
       @lista1.pullHead.should eq (3)
    end
  end
  describe "#Inserción de elementos" do
    it "#Insertar un elemento" do
       
       cola = @lista1.insert(@nodo1)
       cola.value.should eq (2)
       cola.next.should eq (nil)
       nodoAnterior = cola.anterior
       expect(nodoAnterior.value).to eq (3)
       expect(nodoAnterior.next).to eq (@nodo1)
       expect(nodoAnterior.anterior).to eq(nil)
    end
    it "#Insertar varios elementos" do
       cola = @lista1.insertElements(@arrayNodos)
       cola.value.should eq(5)
       cola.next.should eq(nil)
       nodoAnterior = cola.anterior
       expect(nodoAnterior.value).to eq (2)
       expect(nodoAnterior.next).to eq (@nodo2)
    end
    it "#Introducir preguntas en la lista" do
      
      cola  = @lista1.insertElements(@arrayNodosPreguntas)
      preguntaPrueba = cola.value
      expect(preguntaPrueba.to_s).to eq("Es apropiado que una clase Tablero herede de una clase Juego\na)Cierto\nb)Falso\n") 
      cola.next.should eq(nil)
      expect((cola.anterior.value).is_a?Question).to eq(true)
      nodoAnterior = cola.anterior
      preguntaAnterior = nodoAnterior.value
      expect(preguntaAnterior.to_s).to eq("¿Cúal es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend\n\na)Una instancia de la clase Class\nb)Una constante\nc)Un objeto\nd)Ninguna de las anteriores\n") 
      
    end
  end
  describe "#Recoger información nodos" do
    it "#Recoger cabeza de la cola" do
      nodoCabeza = @lista1.cabeza
      nodoCabeza.value.should eq (3)
      nodoCabeza.next.should eq (nil)
    end
  end
end
