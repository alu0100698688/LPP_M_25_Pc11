require "lib/examen.rb"

describe Examen do

  before :each do
    @sS = SimpleSelection.new("¿De qué color es el coche del presidente?",["azul","verde","negro","naranja"])
    @p1 = Examen.new(@sS)
  end  

  describe "# Almacenamiento de la pregunta." do

    it "Se almacena correctamente la pregunta." do
        @p1.myQuestion.ask.should eq("¿De qué color es el coche del presidente?")
    end

    it "Se almacenan correctamente las respuestas." do
        @p1.myQuestion.answers_to_s.should eq("a) azul\nb) verde\nc) negro\nd) naranja\n")
    end
  end
  describe "# Obtencion respuestas" do
    it "Array de opciones" do
      @p1.myQuestion.answers.should eq(["azul","verde","negro","naranja"])
    end
  end 
end
