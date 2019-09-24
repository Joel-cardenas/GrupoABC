class Menu

    def mostrar
        opcion = true
        opcion_chk = 0
        
        vista = Vista.new
        modelo = Asociacion.new
        controlador = Controlador.new(modelo, vista)

        while opcion
            
            if (opcion_chk != 0)
                opcion = opcion_chk
            else
                print "+---------------------------+\n"
                print "Accediendo al menu principal\n"
                print "+---------------------------+\n"

                print "1. Registrar participantes [1]\n"+
                      "2. Mostrar participantes   [2]\n"+
                      "3. Otras operaciones       [3]\n"+
                      "4. Cargar datos de prueba  [4]\n"+
                      "5. Salir                   [5]\n\n"
                print "Ingrese opción [1_3]: ".chomp

                opcion = gets.chomp.to_i
            end

            system("cls")

            case opcion
                when 1
                    if (opcion_chk == 0)
                        print "+---------------------+\n"
                        print "Accedió a la opción [1]\n"
                        print "+---------------------+\n\n"
                    end

                    print "Ingrese los datos:\n\n"
                    
                    print "DATOS DEL DUEÑO\n"
                    print "---------------\n"
                    
                    print "Nombre: \n".chomp
                    no_dueño = gets.chomp
                    
                    print "Apellidos: \n".chomp
                    ap_dueño = gets.chomp
                    
                    print "Dni: ".chomp
                    dni = gets.chomp

                    print "\nDATOS DEL PERRO\n"
                    print "-----------------\n"
                    
                    print "Categorias: \n"
                    print "1. guardian [1] \n"
                    print "2. compañia [2] \n"
                    print "3. comun    [3] \n"

                    categoria = true
                    while categoria
                        print "Ingrese opción [1_3]: \n".chomp
                        categoria = gets.chomp.to_i
                        case categoria
                            when 1
                                categoria = "guardian"
                                break
                            when 2
                                categoria = "compañia"
                                break
                            when 3
                                categoria = "comun"
                                break
                        end
                    end

                    print "\nCategoria: #{categoria}\n"
                    
                    print "Raza: \n".chomp
                    raza = gets.chomp
                    
                    print "Nombre: \n".chomp
                    no_perro = gets.chomp
                    
                    print "Edad: \n".chomp
                    edad = gets.chomp
                    
                    print "Color: \n".chomp
                    color = gets.chomp
                    
                    print "Puntaje de Postura: \n".chomp
                    puntaje_postura = gets.chomp.to_i
                    
                    puntaje_tmp_1 = 0
                    puntaje_tmp_2 = 0

                    if (categoria == "guardian")
                        print "Puntaje de habilidad: \n".chomp
                        puntaje_tmp_1 = gets.chomp.to_i

                    elsif (categoria == "compañia")
                        print "Puntaje de Pelaje: \n".chomp
                        puntaje_tmp_1 = gets.chomp.to_i

                    elsif (categoria == "comun")
                        print "Puntaje de aceptación: \n".chomp
                        puntaje_tmp_1 = gets.chomp.to_i

                        print "Puntaje de disciplina: \n".chomp
                        puntaje_tmp_2 = gets.chomp.to_i
                    end

                    print "\n"

                    print "1. GUARDAR  [1] \n"
                    print "2. CANCELAR [2] \n"

                    accion = true
                    while accion
                        print "Ingrese opción [1_2]: \n".chomp
                        accion = gets.chomp.to_i
                        case accion
                            when 1
                                accion = 'guardar'
                                break
                            when 2
                                accion = 'cancelar'
                                break
                        end
                    end

                    system("cls")

                    if (accion == 'guardar')
                        
                        controlador.registrar(
                            categoria, 
                            no_dueño,
                            ap_dueño,
                            dni,
                            no_perro,
                            edad,
                            color,
                            puntaje_postura,
                            raza, 
                            puntaje_tmp_1,
                            puntaje_tmp_2
                        )

                        print "\nDesea continuar agregando? (Yes, No): \n".chomp
                        continuar = gets.chomp.to_s

                        if (continuar.downcase == 'yes')
                            opcion_chk = 1
                        else
                            opcion_chk = 0
                            system("cls")
                        end
                    end
                
                when 2
                    system("cls")

                    print "+---------------------+\n"
                    print "Accedió a la opción [2]\n"
                    print "+---------------------+\n\n"

                    print "Mostrar participantes: \n"
                    print "1. En general    [1] \n"
                    print "2. Por categoria [2] \n"
                    print "-------------------- \n"
                    print "3. Volver atras  [3] \n"

                    listado = true
                    categoria = ""

                    while listado
                        print "Ingrese opción [1_3]: \n".chomp
                        listado = gets.chomp.to_i
                        
                        case listado
                            when 1
                                system("cls")
                                controlador.imprimirParticipanteGenerales
                                break
                            when 2
                                system("cls")
                                print "Ingrese una categoria: "
                                categoria = gets.chomp.to_s
                                controlador.imprimirParticipanteCategoria(categoria)
                                break
                            when 3
                                system("cls")
                                opcion_chk = 0
                                listado = false
                                break
                        end
                    end

                    if (listado)

                        print "1. Volver menu anterior  [1] \n"
                        print "2. Volver menu principal [2] \n"

                        volver = true
                        while volver
                            print "Ingrese opción [1_2]: \n".chomp
                            volver = gets.chomp.to_i
                            
                            case volver
                                when 1
                                    system("cls")
                                    opcion_chk = 2
                                    break
                                when 2
                                    system("cls")
                                    opcion_chk = 0
                                    break
                            end
                        end
                    end

                when 3
                    system("cls")

                    print "+---------------------+\n"
                    print "Accedió a la opción [3]\n"
                    print "+---------------------+\n\n"

                    print "1. Mostrar ganador general                         [1] \n"
                    print "2. Mostrar ganador por categoria                   [2] \n"
                    print "3. Mostrar cantidad de participantes general       [3] \n"
                    print "4. Mostrar cantidad de participantes por categoria [4] \n"
                    print "------------------------------------------------------ \n"
                    print "5. Volver atras                                    [5] \n"

                    opciones = true
                    while opciones
                        print "Ingrese opción [1_5]: \n".chomp
                        opciones = gets.chomp.to_i
                        
                        case opciones
                            when 1
                                system("cls")
                                controlador.imprimirGanadorGeneral
                                break
                            when 2
                                system("cls")
                                print "Ingrese una categoria: "
                                categoria = gets.chomp.to_s
                                controlador.imprimirGanadorCategoria(categoria)
                                break
                            when 3
                                system("cls")
                                controlador.imprimirTotalParcipantesGeneral
                                break
                            when 4
                                system("cls")
                                print "Ingrese una categoria: "
                                categoria = gets.chomp.to_s
                                controlador.imprimirTotalParcipantesCategoria(categoria)
                                break
                            when 5
                                system("cls")
                                opciones = false
                                break
                        end
                    end

                    if (opciones)
                        print "---------------------------- \n"
                        print "1. Volver menu anterior  [1] \n"
                        print "2. Volver menu principal [2] \n"

                        volver = true
                        while volver
                            print "Ingrese opción [1_2]: \n".chomp
                            volver = gets.chomp.to_i
                            
                            
                            case volver
                                when 1
                                    system("cls")
                                    opcion_chk = 3
                                    break
                                when 2
                                    system("cls")
                                    opcion_chk = 0
                                    break
                            end
                        end
                    end

                when 4

                    print "Procesando los datos...\n"

                    controlador.registrar("guardian", "Jametz", "Salvatier", "11111111", "Lazy", 10, "Negros", 10, 'Pastor Alemán', 7 ) 
                    controlador.registrar("guardian", "Nellaz", "Gutierrez", "22222222", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
                    controlador.registrar("compañia", "Luisaz", "Guzmanani", "33333333", "Peqz", 10, "Marron", 10, 'Pekinés' , 10)
                    controlador.registrar("compañia", "Daniel", "Sandovall", "44444444", "Sisi", 8,  "Grises", 8 , 'Terrier' , 9 )
                    controlador.registrar("comun"   , "Paloma", "Perezguaa", "55555555", "Dubo", 10, "Blanco", 10, 'No tiene raza', 10, 8 )
                    controlador.registrar("comun"   , "Brenda", "Ramirezoo", "66666666", "Dink", 7,  "Blanco", 8 , 'No tiene raza', 8 , 8 )
                    controlador.registrar("comun"   , "Brenda", "Ramirezoo", "11111111", "Dink", 7,  "Blanco", 8 , 'No tiene raza', 8 , 8 )
                    controlador.registrar("compañia", "Luisaz", "Guzmanani", "22222222", "Peqz", 10, "Marron", 10, 'Pekinés' , 10)

                    print "---------------------------- \n"
                    print "1. Volver menu principal [1] \n"

                    volver = true
                    while volver
                        print "Ingrese opción : \n".chomp
                        volver = gets.chomp.to_i
                        
                        case volver
                            when 1
                                system("cls")
                                opcion_chk = 0
                                break
                        end
                    end

                when 5
                    break
            end
        end
    end
end

