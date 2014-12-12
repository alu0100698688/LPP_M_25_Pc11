#encoding: UTF-8
require_relative "../lib/quiz.rb"

describe Quiz do
    
    before :each do
       
       
    end
    
    describe "#Creación de un examen" do
       it "#Crear un nuevo cuestionario" do
          newQuiz = Quiz.new("Cuestionario 1"){
              question '¿Cuánto son 2+2?',
                        wrong => '10',
                        wrong => '3',
                        wrong => '5',
                        right => '4'
              
              
          }
          expect(newQuiz.questions.count).to eq(1)
       end
        
    end
    
end