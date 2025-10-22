import camion2.*
object knightRider {
    method peso() = 500

    method nivelPeligrosidad() = 10

    method totalBultos() = 1

    method consecuencia() {}
}

object bumblebee {
    var estaComoAuto = false

    method cambiarForma(){
        estaComoAuto = !estaComoAuto
    }

    method peso() = 800

    method nivelPeligrosidad() {
        if (estaComoAuto) {
            return 15
        }
        else {
            return 300
        }
    }

    method totalBultos() = 2

    method consecuencia() {
        estaComoAuto = false
    }
}

object paqueteDeLadrillos {
    var property cantidad = 0

    method peso() = 2 * cantidad

    method nivelPeligrosidad() = 2

    method totalBultos(){
        if (cantidad.min(100)){
            return 1
        }
        else if (cantidad.between(101, 300)){
            return 2
        }
        else {
            return 3
        }
    }
}

object arenaAGranel {
    var property peso = 0

    method nivelPeligrosidad() = 1

    method totalBultos() = 1

    method consecuencia() {
        peso = peso - 10
    }
}

object bateriaAntiaérea {
    var tieneMisiles = false

    method cargarMisiles() {
        tieneMisiles = true
    }

    method descargarMisiles() {
        tieneMisiles = false
    }

    method peso() {
        if (tieneMisiles) {
            return 300
        }
        else {
            return 200
        }
    }

    method nivelPeligrosidad() {
        if (tieneMisiles) {
            return 100
        }
        else {
            return 0
        }
    }

    method totalBultos() {
        return if (tieneMisiles) 2 else 1
    }

    method consecuencia() {
        self.cargarMisiles()
    }
}

object contenedorPorturario{
    const property contenido = []

    method agregarContenido(unObjeto) {
        contenido.add(unObjeto)
    }

    method quitarContenido(unObjeto) {
        contenido.remove(unObjeto)
    }

    method peso() = 100 + contenido.sum{objeto => objeto.peso()}

    method nivelPeligrosidad() {
        return if (contenido.isEmpty()) 0 else contenido.max{objeto => objeto.nivelPeligrosidad()}
    }

    method totalBultos() = 1 + contenido.sum({cosa => cosa.totalBultos()})

    method consecuencia() {
        contenido.forEach({objeto => objeto.consecuencia()})
    }
}

object  residuosRadioactivos {
    var property peso = 0

    method nivelPeligrosidad() = 200

    method totalBultos() = 1

    method consecuencia() {
        peso += 15
    }
}

object embalaqueDeSeguridad {
    const property contenido = []

    method agregarContenido(unObjeto) {
        contenido.add(unObjeto)
    }

    method quitarContenido(unObjeto) {
        contenido.remove(unObjeto)
    }

    method peso() = contenido.sum{objeto => objeto.peso()}

    method nivelPeligrosidad() = contenido.sum{objeto => objeto.nivelPeligrosidad()} / 2

    method totalBultos() = 2

    method consecuencia() {}
}