import camion.*
object knightRider {
    method peso() = 500

    method nivelPeligrosidad() = 10
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
}

object paqueteDeLadrillos {
    var property cantidad = 0

    method peso() = 2 * cantidad

    method nivelPeligrosidad() = 2
}

object arenaAGranel {
    var property peso = 0

    method nivelPeligrosidad() = 1
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
}

object  residuosRadioactivos {
    var property peso = 0

    method nivelPeligrosidad() = 200
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
}