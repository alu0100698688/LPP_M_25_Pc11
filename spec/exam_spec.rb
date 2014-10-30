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
    @nodoCabeza = Node.new
    @nodoCabeza[:value] = 3
    @nodoCabeza[:next] = nil
    @lista1 = List.new(@nodoCabeza)
  end  

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
end
