#encoding: UTF-8
require_relative "../lib/quiz.rb"

describe Quiz do
    
    before :each do
       @quiz1 = Quiz.new("Cuestionario de LPP 05/12/2014") {
            question '¿Cuántos argumentos de tipo bloque puede recibir un método?',
                     right =>'1',
                     wrong =>'2',
                     wrong =>'muchos',
                     wrong =>'los que defina el usuario'
            question 'En Ruby los bloque son objetos que continen código',
                    wrong =>'Cierto',
                    right =>'Falso'
       }
       
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
    
    describe "#Mostrar examen" do
        it "#Mostrar preguntas y respuestas" do
            cadena = "¿Cuántos argumentos de tipo bloque puede recibir un método?\n 1. 1\n 2. 2\n 3. muchos\n 4. los que defina el usuario\n"
            cadena += "En Ruby los bloque son objetos que continen código\n 1. Cierto\n 2. Falso\n"
            expect(@quiz1.to_s).to  eq(cadena)     
        end
    end
    
    describe "#Responder preguntas" do
        it "#Todas correctas" do
            answersUser = [1,2]
            expect(@quiz1.checkAnswers(answersUser)).to eq("Resultado: 2/2")    
        end
        it "#Suspenso" do
            answersUser = [2,1]
            expect(@quiz1.checkAnswers(answersUser)).to eq("Resultado: 0/2") 
        end
    end
    
end