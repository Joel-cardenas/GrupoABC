require "test/unit"
require_relative "../Models/Asociacion"
require_relative "../Views/Perro"
require_relative "../Controllers/Perro"
require_relative "../Factories/Perro"

class Dueño
    attr_accessor :nombre_dueño, :apellido, :dni
    
    def initialize(nombre_dueño, apellido, dni)
        @nombre_dueño = nombre_dueño
        @apellido = apellido
        @dni = dni
    end
end

class Perro < Dueño
    attr_accessor :nombre_perro, :edad, :color, :puntaje_postura
    
    def initialize(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura)
        super(nombre_dueño, apellido, dni)
        raise ExcepcionPuntajeIncorrecto, "El puntaje de postura #{puntaje_postura} no es válido" if (puntaje_postura < 0 || puntaje_postura >10)
        @nombre_perro = nombre_perro
        @edad = edad
        @color = color
        @puntaje_postura = puntaje_postura
    end

    def calcularCalificacion
        return puntaje_postura * 9
    end
end

class PerroGuardian < Perro
    attr_accessor :nombre_raza, :puntaje_habilidad

    def initialize(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura, nombre_raza, puntaje_habilidad)
        super(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura)
        raise ExcepcionPuntajeIncorrecto, "El puntaje de la habilidad #{puntaje_habilidad} no es válido" if (puntaje_habilidad < 0 || puntaje_habilidad >10)
        @nombre_raza = nombre_raza
        @puntaje_habilidad = puntaje_habilidad
    end

    def calcularCalificacion
        return super + puntaje_habilidad
    end

    def obtenerCategoria
        return "guardian"
    end
end

class PerroCompañia < Perro
    attr_accessor :nombre_raza, :puntaje_pelaje
    def initialize(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura, nombre_raza, puntaje_pelaje)
        super(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura)
        raise ExcepcionPuntajeIncorrecto, "El puntaje del pelaje #{puntaje_pelaje} no es válido" if (puntaje_pelaje < 0 || puntaje_pelaje >10)
        @nombre_raza = nombre_raza
        @puntaje_pelaje = puntaje_pelaje
    end

    def calcularCalificacion
        return super + puntaje_pelaje
    end

    def obtenerCategoria
        return "compañia"
    end
end

class PerroComun < Perro
    attr_accessor :nombre_raza, :puntaje_aceptacion, :puntaje_disciplina

    def initialize(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura, nombre_raza, puntaje_aceptacion, puntaje_disciplina)
        super(nombre_dueño, apellido, dni, nombre_perro, edad, color, puntaje_postura)
        raise ExcepcionPuntajeIncorrecto, "El puntaje de disciplina #{puntaje_disciplina} no es válido" if (puntaje_disciplina < 0 || puntaje_disciplina >10)
        raise ExcepcionPuntajeIncorrecto, "El puntaje de aceptacion #{puntaje_aceptacion} no es válido" if (puntaje_aceptacion < 0 || puntaje_aceptacion >10)
        @nombre_raza = nombre_raza
        @puntaje_aceptacion = puntaje_aceptacion
        @puntaje_disciplina = puntaje_disciplina
    end

    def calcularCalificacion
        return super + ((puntaje_aceptacion + puntaje_disciplina) / 2)
    end

    def obtenerCategoria
        return "comun"
    end
end
##AGREGADO
class ExcepcionPuntajeIncorrecto < StandardError
end
##FIN

vista = Vista.new
modelo = Asociacion.new

begin
 controlador = Controlador.new(modelo, vista)
 controlador.registrar("guardian", "Jametz", "Salvatier", "12345678", "Lazy", 8, "Negros", 8, 'Pastor Alemán', 10 ) 
 controlador.registrar("guardian", "Nellaz", "Gutierrez", "32165498", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
 controlador.registrar("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 10, "Marron", 10, 'Pekinés' , 10)
 controlador.registrar("compañia", "Daniel", "Sandovall", "22222222", "Sisi", 8,  "Grises", 8 , 'Terrier' , 9 )
 controlador.registrar("comun"   , "Paloma", "Perezguaa", "33333333", "Dubo", 10, "Blanco", 10, 'No tiene raza', 10, 8 )
 controlador.registrar("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 7,  "Blanco", 8 , 'No tiene raza', 1 , 8 )
 controlador.registrar("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 7,  "Blanco", 8 , 'No tiene raza', 8 , 8 )
 controlador.registrar("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 10, "Marron", 10, 'Pekinés' , 10)
rescue ExcepcionPuntajeIncorrecto => exc
    puts "#{exc.class}: #{exc.message}"
end

