require_relative "node.rb"
class List
   def initialize(nodoCabeza)
       @cabeza = nodoCabeza
   end
   def pullHead
      @cabeza = @cabeza[:next]
   end
   def insert(node)
      actual = @cabeza
      siguiente = @cabeza[:next]
      while siguiente != nil
          actual = siguiente
          siguiente = actual[:next]
      end
      actual[:next] = node
       
      actual[:next]
   end
   def insertElements(arrayNodos)
      i=0
      while i<arrayNodos.length
            actual = @cabeza
            siguiente = @cabeza[:next]

            while siguiente != nil
               actual = siguiente
               siguiente = actual[:next]
            end
            actual[:next] = arrayNodos[i]
            
            i +=1
       end
       actual[:next] #Se devuelve el ultimo nodo insertado
      
   end
    
end