require_relative "./answer.rb"
class Question
    
  ORDER = 0
  KIND = 1
  attr_accessor :text, :answers

  def initialize(text, answers)
    @text = text

    #Primero posición de la respuesta en el examen, luego si es correcta o incorrecta y por último la respuesta.
    @answers = answers.map { |k, v| Answer.new(k[ORDER], k[KIND],  v) }.sort
  end
  
  def to_s
    cadena = @text + "\n"
    @answers.each do |answer|
        cadena << " #{answer}\n"
    end
    cadena
  end

end