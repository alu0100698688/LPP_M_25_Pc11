require_relative "node.rb"
# Clase que permitirá crear una lista de objetos.
class Node
   include Comparable
=begin 
Método que se ha de implementar al incluir el Mixin Comparable y con el que se hace la comparativa
entre el valor del nodo y otro pasado por parámetro
=end
   def <=> (other)
      value <=> other.value
   end
end
# Clase que permite crear un listado de nodos. Se ha incluido el Mixin Enumerable.
class List
   include Enumerable
   # Atributos cola y cabeza que permitirán la identificación del principio y fin de la lista.
   attr_reader :cabeza,:cola
   # Inicialización de variables cabeza y cola.
   def initialize(nodoCabeza)
       @cabeza = nodoCabeza
       @cola = @cabeza.next
   end
   # Método que permite extraer la cabeza de la lista
   def pullHead
      if @cabeza != nil
   
         contenido = @cabeza.value
         @cabeza = @cabeza.next
      end
      contenido
      
   end
   # Método que permite insertar un nodo en la lista
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
   # Método que recibe un conjunto de nodos y los inserta en la lista.
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
   # Método que permite eliminar un nodo de lista independientemente de su posición en ella.
   def delete(nodo)
      if nodo == @cola
         contenido = @cola.value
         @cola = nodo.anterior
         @cola.next = nil
         
      else
         if nodo == @cabeza 
            
            pullHead(nodo)
            
         else
            actual = @cabeza
            while actual != nodo
               actual = actual.next
            end
            anterior = actual.anterior
            siguiente = actual.next
            anterior.next = siguiente
            siguiente.anterior = anterior
            contenido = siguiente.value
         end
        
      end
      contenido
   end
   
=begin 
Método implementado al incluir el Mixin Enumerable y con el cual devolvemos el valor de cada nodo de la 
lista
=end   
   def each
      actual = @cabeza
      while actual != nil
         yield actual.value
         actual = actual.next
      end
      
   end 
   
   
    
end