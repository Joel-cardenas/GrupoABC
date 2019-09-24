class Asociacion
    attr_accessor :arreglo_perros

    def initialize()
        @arreglo_perros = []
    end

    def registrar(perro)
        if (!validarParticipanteDniDuplicado(perro.dni))
            arreglo_perros.push(perro)
            return true
        end
        return false
    end

    # Obtiene una lista de perros 
    def obtenerParticipantesGenerales(sort)

        arreglo = arreglo_perros.sort_by{ |p| p.nombre_dueño }
        arreglo = sort == "desc" ? arreglo.reverse : arreglo

        return arreglo
    end

    # Obtiene perros por categoria
    def obtenerParticipantesCategoria(categoria, sort = 'asc')
        arreglo = []
        
        for p in arreglo_perros
            if p.obtenerCategoria == categoria
                arreglo.push(p)
            end
        end
        
        if (!arreglo.empty?)
            arreglo = arreglo.sort_by{ |p| p.nombre_dueño }
            arreglo = sort == "desc" ? arreglo.reverse : arreglo
        end
        
        return arreglo
    end

    # Obtiene la cantidad por categoria
    def obtenerTotalParcipantesGeneral()
        return arreglo_perros.length
    end

    # Obtiene la cantidad por categoria
    def obtenerTotalParcipantesCategoria(categoria)
        return obtenerParticipantesCategoria(categoria).length
    end

    # Obtiene el ganador general
    def obtenerGanadorGeneral
        max = 0
        objeto = nil

        for p in arreglo_perros
            if p.calcularCalificacion > max 
                objeto = p
                max = p.calcularCalificacion
            end
        end

        return objeto
    end

    # Obtiene el ganador por categoria
    def obtenerGanadorCategoria(categoria)
        max = 0
        objeto = nil

        for p in arreglo_perros
            if p.obtenerCategoria == categoria
                if p.calcularCalificacion > max 
                    objeto = p
                    max = p.calcularCalificacion
                end
            end
        end

        return objeto
    end

    # Valida DNI duplicados
    def validarParticipanteDniDuplicado(dni)
        
        for p in arreglo_perros
            if (p.dni == dni)
                return p
            end
        end

        return false
    end
end

