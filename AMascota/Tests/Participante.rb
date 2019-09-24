require "test/unit"
require_relative "../perro"

class TestParticipantes < Test::Unit::TestCase
    def test_registro
        asocc = Asociacion.new
        p1 = Factoria.createObjeto("guardian", "Jametz", "Salvatier", "12345678", "Lazy", 10, "Negro", 10, 'Pastor Alemán', 7 )
        p2 = Factoria.createObjeto("guardian", "Nellaz", "Gutierrez", "32165498", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
        p3 = Factoria.createObjeto("guardian", "Joel", "Zalazar", "45127874", "Pipo", 9,  "Marron", 9 , 'Doberman', 8 ) 
        p4 = Factoria.createObjeto("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 7, "Marron", 10, 'Pekinés' , 9)
        p5 = Factoria.createObjeto("compañia", "Daniel", "Sandovall", "22222222", "Sisi", 8,  "Grises", 8 , 'Terrier' , 7 )
        p6 = Factoria.createObjeto("compañia", "Rafael", "Morales", "47458658", "Pluto", 9,  "Oro", 8 , 'Dalmata' , 9 )
        p7 = Factoria.createObjeto("comun"   , "Paloma", "Perezguaa", "33333333", "Dubo", 10, "Blanco", 9, 'No tiene raza', 10, 8 )
        p8 = Factoria.createObjeto("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 8,  "Gris", 8 , 'No tiene raza', 7 , 9 )
        p9 = Factoria.createObjeto("comun"   , "Fredy", "Morales", "47856478", "Chuki", 9,  "Negro", 9 , 'No tiene raza', 8 , 8 )
        asocc.registrar(p1)
        asocc.registrar(p2)
        asocc.registrar(p3)
        asocc.registrar(p4)
        asocc.registrar(p5)
        asocc.registrar(p6)
        asocc.registrar(p7)
        asocc.registrar(p8)
        asocc.registrar(p9)
        lista = asocc.obtenerParticipantesGenerales("desc")
        assert_equal 9, lista.size  
    end

    def test_cantidad_de_participantes_por_categoria
        asocc = Asociacion.new
        p1 = Factoria.createObjeto("guardian", "Jametz", "Salvatier", "12345678", "Lazy", 10, "Negro", 10, 'Pastor Alemán', 7 )
        p2 = Factoria.createObjeto("guardian", "Nellaz", "Gutierrez", "32165498", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
        p3 = Factoria.createObjeto("guardian", "Joel", "Zalazar", "45127874", "Pipo", 9,  "Marron", 9 , 'Doberman', 8 ) 
        p4 = Factoria.createObjeto("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 7, "Marron", 10, 'Pekinés' , 9)
        p5 = Factoria.createObjeto("compañia", "Daniel", "Sandovall", "22222222", "Sisi", 8,  "Grises", 8 , 'Terrier' , 7 )
        p6 = Factoria.createObjeto("compañia", "Rafael", "Morales", "47458658", "Pluto", 9,  "Oro", 8 , 'Dalmata' , 9 )
        p7 = Factoria.createObjeto("comun"   , "Paloma", "Perezguaa", "33333333", "Dubo", 10, "Blanco", 9, 'No tiene raza', 10, 8 )
        p8 = Factoria.createObjeto("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 8,  "Gris", 8 , 'No tiene raza', 7 , 9 )
        p9 = Factoria.createObjeto("comun"   , "Fredy", "Morales", "47856478", "Chuki", 9,  "Negro", 9 , 'No tiene raza', 8 , 8 )
        asocc.registrar(p1)
        asocc.registrar(p2)
        asocc.registrar(p3)
        asocc.registrar(p4)
        asocc.registrar(p5)
        asocc.registrar(p6)
        asocc.registrar(p7)
        asocc.registrar(p8)
        asocc.registrar(p9)
   
        cantidad = asocc.obtenerParticipantesCategoria("guardian", sort = 'asc')
        assert_equal 3, cantidad.size 
    end

    def test_ganador_genral
        asocc = Asociacion.new
        p1 = Factoria.createObjeto("guardian", "Jametz", "Salvatier", "12345678", "Lazy", 10, "Negro", 10, 'Pastor Alemán', 7 )
        p2 = Factoria.createObjeto("guardian", "Nellaz", "Gutierrez", "32165498", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
        p3 = Factoria.createObjeto("guardian", "Joel", "Zalazar", "45127874", "Pipo", 9,  "Marron", 9 , 'Doberman', 8 ) 
        p4 = Factoria.createObjeto("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 7, "Marron", 10, 'Pekinés' , 9)
        p5 = Factoria.createObjeto("compañia", "Daniel", "Sandovall", "22222222", "Sisi", 8,  "Grises", 8 , 'Terrier' , 7 )
        p6 = Factoria.createObjeto("compañia", "Rafael", "Morales", "47458658", "Pluto", 9,  "Oro", 8 , 'Dalmata' , 9 )
        p7 = Factoria.createObjeto("comun"   , "Paloma", "Perezguaa", "33333333", "Dubo", 10, "Blanco", 9, 'No tiene raza', 10, 8 )
        p8 = Factoria.createObjeto("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 8,  "Gris", 8 , 'No tiene raza', 7 , 9 )
        p9 = Factoria.createObjeto("comun"   , "Fredy", "Morales", "47856478", "Chuki", 9,  "Negro", 9 , 'No tiene raza', 8 , 8 )
        asocc.registrar(p1)
        asocc.registrar(p2)
        asocc.registrar(p3)
        asocc.registrar(p4)
        asocc.registrar(p5)
        asocc.registrar(p6)
        asocc.registrar(p7)
        asocc.registrar(p8)
        asocc.registrar(p9)
        ganador = asocc.obtenerGanadorGeneral
        assert_equal "Peqz", ganador.nombre_perro       
    end

    def test_verificar_dni
        asocc = Asociacion.new
        p1 = Factoria.createObjeto("guardian", "Jametz", "Salvatier", "12345678", "Lazy", 10, "Negro", 10, 'Pastor Alemán', 7 )
        p2 = Factoria.createObjeto("guardian", "Nellaz", "Gutierrez", "32165498", "Boby", 9,  "Blanco", 8 , 'Labrador', 6 )
        p3 = Factoria.createObjeto("guardian", "Joel", "Zalazar", "45127874", "Pipo", 9,  "Marron", 9 , 'Doberman', 8 ) 
        p4 = Factoria.createObjeto("compañia", "Luisaz", "Guzmanani", "11111111", "Peqz", 7, "Marron", 10, 'Pekinés' , 9)
        p5 = Factoria.createObjeto("compañia", "Daniel", "Sandovall", "11111113", "Sisi", 8,  "Grises", 8 , 'Terrier' , 7 )
        p6 = Factoria.createObjeto("compañia", "Rafael", "Morales", "47458658", "Pluto", 9,  "Oro", 8 , 'Dalmata' , 9 )
        p7 = Factoria.createObjeto("comun"   , "Paloma", "Perezguaa", "33333333", "Dubo", 10, "Blanco", 9, 'No tiene raza', 10, 8 )
        p8 = Factoria.createObjeto("comun"   , "Brenda", "Ramirezoo", "44444444", "Dink", 8,  "Gris", 8 , 'No tiene raza', 7 , 9 )
        p9 = Factoria.createObjeto("comun"   , "Fredy", "Morales", "47856478", "Chuki", 9,  "Negro", 9 , 'No tiene raza', 8 , 8 )
        asocc.registrar(p1)
        asocc.registrar(p2)
        asocc.registrar(p3)
        asocc.registrar(p4)
        asocc.registrar(p5)
        asocc.registrar(p6)
        asocc.registrar(p7)
        asocc.registrar(p8)
        asocc.registrar(p9)
        usuario =asocc.validarParticipanteDniDuplicado("11111111")
        assert_equal "11111111", usuario.dni
    end
end
