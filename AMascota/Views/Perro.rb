class Vista

    def mostrar(mensaje)
        puts mensaje
    end

    def mostrarListado(arreglo)
        titulo = "LISTA DE CONCURSANTES"

        puts "-".rjust(titulo.length,'-')
        puts titulo

        cols = "| Nro".ljust(3) +
                " | "+"Nombre del Dueño".ljust(19) +
                " | "+"Dni".ljust(8) +
                " | "+"Categoria".ljust(10) +
                " | "+"Raza".ljust(19) +
                " | "+"Perro".ljust(10) +
                " | "+"Edad".ljust(4) +
                " | "+"Color".ljust(10) +
                " | "+"Postura".ljust(7) +
                " | "+"Pt. total".ljust(4)

        puts "+"+"+".rjust(cols.length,'-')
        puts cols
        puts "+"+"+".rjust(cols.length,'-')

        if (!arreglo.empty?)
            i = 1
            for p in arreglo
                print "| #{i.to_s.ljust(3)}"
                print " | #{(p.nombre_dueño+' '+p.apellido).ljust(19)}"
                print " | #{(p.dni).ljust(8)}"
                print " | #{(p.obtenerCategoria).ljust(10)}"
                print " | #{p.nombre_raza.ljust(19)}"
                print " | #{p.nombre_perro.ljust(10)}"
                print " | #{p.edad.to_s.ljust(4)}"
                print " | #{(p.color).ljust(10)}"
                print " | #{(p.puntaje_postura).to_s.ljust(7)}"
                print " | #{(p.calcularCalificacion).to_s.ljust(4)}"
                puts ""
                i += 1
            end
        else
            puts "No se encontraron resultados."
        end

        puts ""
    end
    
    def mostrarGanador(objeto)

        if (objeto)
            titulo = "El ganador general de la competencia:"

            puts "-".rjust(titulo.length,'-')
            puts titulo
            puts "+"+"+".rjust(titulo.length,'-')

            cols = "| Nro".ljust(3) +
                    " | Nombre del Dueño".ljust(19) +
                    " | "+"Dni".ljust(8) +
                    " | "+"Categoria".ljust(10) +
                    " | "+"Raza".ljust(19) +
                    " | "+"Perro".ljust(10) +
                    " | "+"Edad".ljust(4) +
                    " | "+"Color".ljust(10) +
                    " | "+"Postura".ljust(7) +
                    " | "+"Puntaje total".ljust(4)

            puts cols
            puts "+"+"+".rjust(cols.length,'-')

            print "| "+"1".ljust(3)
            print " | #{(objeto.nombre_dueño+' '+objeto.apellido).ljust(19)}"
            print " | #{(objeto.dni).ljust(8)}"
            print " | #{(objeto.obtenerCategoria).ljust(10)}"
            print " | #{objeto.nombre_raza.ljust(19)}"
            print " | #{objeto.nombre_perro.ljust(10)}"
            print " | #{objeto.edad.to_s.ljust(4)}"
            print " | #{(objeto.color).ljust(10)}"
            print " | #{(objeto.puntaje_postura).to_s.ljust(7)}"
            print " | #{(objeto.calcularCalificacion).to_s.ljust(4)}"

            puts ""
            puts ""
        else
            puts "No se encontró ningún ganador."
        end
    end

    def mostrarTotalParcipantes(cantidad)
        titulo = "Cantidad de participantes: #{cantidad}"

        puts "+"+"+".rjust(titulo.length,'-')
        puts titulo
        puts "+"+"+".rjust(titulo.length,'-')
        puts ""
    end

    def mostrarParticipanteDniDuplicado(objecto)
        if (objecto)
            titulo = "Participante con DNI duplicado es: #{objecto.dni}" 
        else
            titulo = "El DNI que estás buscando no ha sido encontrado."
        end

        puts "+"+"+".rjust(titulo.length,'-')
        puts titulo
        puts "+"+"+".rjust(titulo.length,'-')
        puts ""
    end
end