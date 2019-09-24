class Controlador
    attr_accessor :modelo, :vista
    
    def initialize(modelo, vista)
        @modelo = modelo
        @vista = vista
    end

    def registrar(categoria, *arg)
        objeto = Factoria.createObjeto(categoria, *arg)
        boleean = modelo.registrar(objeto)
        if (boleean)
            vista.mostrar('El perro se ha registrado correctamente!')
        end
    end

    def imprimirParticipanteGenerales(sort = "asc")
        arreglo = modelo.obtenerParticipantesGenerales(sort)
        vista.mostrarListado(arreglo)
    end

    def imprimirParticipanteCategoria(categoria, sort = 'asc')
        arreglo = modelo.obtenerParticipantesCategoria(categoria, sort)
        vista.mostrarListado(arreglo)
    end

    def imprimirGanadorGeneral
        objeto = modelo.obtenerGanadorGeneral
        vista.mostrarGanador(objeto)
    end

    def imprimirGanadorCategoria(categoria)
        objeto = modelo.obtenerGanadorCategoria(categoria)
        vista.mostrarGanador(objeto)
    end

    def imprimirTotalParcipantesGeneral()
        total = modelo.obtenerTotalParcipantesGeneral()
        vista.mostrarTotalParcipantes(total)
    end

    def imprimirTotalParcipantesCategoria(categoria)
        total = modelo.obtenerTotalParcipantesCategoria(categoria)
        vista.mostrarTotalParcipantes(total)
    end

    def imprimirParticipanteDniDuplicado(dni)
        objeto = modelo.validarParticipanteDniDuplicado(dni)
        vista.mostrarParticipanteDniDuplicado(objeto)
    end
end
