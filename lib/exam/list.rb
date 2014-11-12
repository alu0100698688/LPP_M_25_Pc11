require_relative "node.rb"
class List
   include Enumerable
   attr_reader :cabeza,:cola
   def initialize(nodoCabeza)
       @cabeza = nodoCabeza
       @cola = @cabeza.next
   end
   def pullHead
      if @cabeza != nil
   
         contenido = @cabeza.value
         @cabeza = @cabeza.next
      end
      contenido
      
   end
   def insert(node)
      if @cola == nil
         node.anterior = @cabeza
         @cola = node
         @cabeza.next = @cola
         
      else
         @cola.next = node
         @cola.next.anterior = @cola
         @cola = @cola.next
      end
      @cola
   end
   def insertElements(arrayNodos)
     i=0
      if @cola == nil
         arrayNodos[0].anterior = @cabeza
         @cola = arrayNodos[0]
         @cabeza.next = @cola
         i += 1
      end
      while i<arrayNodos.length
            arrayNodos[i].anterior = @cola
            @cola.next = arrayNodos[i]
            @cola = @cola.next
            
            i +=1
       end
      
      @cola #Se devuelve el ultimo nodo insertado
      
   end
   def each
      actual = @cabeza
      while actual != nil
         yield actual.value
         actual = actual.next
      end
      
   end 
    
end