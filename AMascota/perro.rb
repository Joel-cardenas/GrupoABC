require_relative "Models/Asociacion"
require_relative "Views/Perro"
require_relative "Controllers/Perro"
require_relative "Factories/Perro"

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
