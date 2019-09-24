class Factoria
    def self.createObjeto(tipo, *arg)
        if (tipo == 'guardian')
            return PerroGuardian.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8])
        elsif (tipo == 'compañia')
            return PerroCompañia.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8])
        elsif (tipo == 'comun')
            return PerroComun.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8], arg[9])
        end
    end
end
