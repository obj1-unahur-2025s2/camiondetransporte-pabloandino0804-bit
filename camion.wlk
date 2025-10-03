import cosas.*
object camion {
    const property carga = []

    method cargar(unObjeto) {
        carga.add(unObjeto)
    }

    method descargar(unObjeto) {
        carga.remove(unObjeto)
    }

    method pesoTotal() = 1000 + carga.sum{objeto => objeto.peso()}

    method tieneTodoPar() {
        return carga.all({objeto => objeto.peso().even()})
    }

    method hayObjetoConPeso(unPeso) = carga.any{objeto => objeto.peso() == unPeso}

    method primeroconNivel(unNivel){
        return carga.find({objeto => objeto.nivelPeligrosidad() == unNivel})
    }

    method cosasQueSuperan(unValor) {
        return carga.filter{objeto => objeto.nivelPeligrosidad() > unValor}
    }

    method cosasQuesuperanElNivelDePeligrosidad(unObjeto){
        return carga.filter{objeto => objeto.nivelPeligrosidad() > unObjeto.nivelPeligrosidad()}
    }

    method excedeElPesoMaximo() = self.pesoTotal() > 2500

    method puedeCircularUnaRuta(nivelDePeligrosidad) = !self.excedeElPesoMaximo() and self.cosasQuesuperanElNivelDePeligrosidad(nivelDePeligrosidad).size() == 0

    method laPeligrosidadTotalEsMayor(unValor) = carga.sum{objeto => objeto.nivelPeligrosidad()} > unValor

    method tieneAlgoEntreValores(valorMin, valorMax) = carga.any{objeto => objeto.peso().between(valorMin, valorMax)}

    method objetoMasPesado() = carga.max{objeto => objeto.peso()}
}