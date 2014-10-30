require "lib/examen.rb"

describe Examen do

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
    @p1 = Examen.new(@questions)
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
    it "Preguntas y respuestas de examen" do
       @p1.to_s.should eq("¿De qué color es el coche del presidente?\na)azul\nb)verde\nc)negro\nd)naranja\n¿Que es un perro?\na)Un ave\nb)Un reptil\nc)Un mamifero\nd)Ninguna de las anteriores\n")
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
end
