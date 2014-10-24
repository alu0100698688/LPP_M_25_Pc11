require "lib/examen.rb"

describe Examen do

  before :each do
    @sS1 = SimpleSelection.new("¿De qué color es el coche del presidente?",["azul","verde","negro","naranja"])
    @sS2 = SimpleSelection.new("¿Que es un perro?",["Un ave","Un reptil","Un mamifero","Ninguna de las anteriores"])
    @questions =[@sS1,@sS2] 
    @p1 = Examen.new(@questions)
  end  

  describe "# Almacenamiento de la pregunta." do

    it "Se almacena correctamente la pregunta." do
        @sS1.ask.should eq("¿De qué color es el coche del presidente?")
    end

    it "Se almacenan correctamente las respuestas." do
        @sS1.answers_to_s.should eq("a)azul\n b)verde\n c)negro\n d)naranja\n")
    end
  end
  describe "# Obtencion respuestas" do
    it "Array de opciones" do
      @sS1.answers.should eq(["azul","verde","negro","naranja"])
    end
  end 
  describe "#Mostrar preguntas y respuestas" do
    it "Mostrar una pregunta y su respuesta" do
       @sS1.to_s.should eq("¿De qué color es el coche del presidente?\n a)azul\n b)verde\n c)negro\n d)naranja\n")
    end  
    it "Preguntas y respuestas de examen" do
       @p1.to_s.should eq("¿De qué color es el coche del presidente?\n a)azul\n b)verde\n c)negro\n d)naranja\n ¿Que es un perro?\n a)Un ave\n b)Un reptil\n c)Un mamifero\n d)Ninguna de las anteriores\n")
    end
  end
end
