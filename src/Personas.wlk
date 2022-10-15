import Marcas.*
import Carpas.*

class Persona{
	var peso
	const jarrasCompradas = []
	var property escuchaMusicaTradicional
	var nivelDeAguante
	var property nacionalidad
	
	method comprarCerveza(unaJarra){//ESTE
		jarrasCompradas.add(unaJarra)
	}
	method totalDeAlcoholIngerido() = jarrasCompradas.map({j => j.contenidoAlcoholico()}).sum()

	method estaEbrio() = self.totalDeAlcoholIngerido() * peso > nivelDeAguante
	
	method leGusta(marcaDeCerveza) = nacionalidad.leGustaLaCerveza(marcaDeCerveza)
	
	method quiereEntrar(unaCarpa) = 
		self.leGusta(unaCarpa.marca()) and self.gustoMusical(unaCarpa) and self.condicionExtra(unaCarpa)
		
	method condicionExtra(unaCarpa) = 
		if(nacionalidad == aleman) unaCarpa.cantidadEsPar()
		else true
		
	method gustoMusical(unaCarpa) = unaCarpa.tieneBandaTradicional() == escuchaMusicaTradicional
	
	method puedeEntrar(unaCarpa) = self.quiereEntrar(unaCarpa) and unaCarpa.dejaIngresar(self)
	
	method esBorrachoEmpedernido() = 
		self.estaEbrio() and jarrasCompradas.all({j => j.capacidadLitros()>= 1})
		
	method esPatriota() =//ESTE
		jarrasCompradas.all({j => j.marcaDeCerveza().paisDeOrigen() == nacionalidad})
	
	method marcasCompradas() = 
		jarrasCompradas.map({j => j.marcaDeCerveza()}).asSet()
		
	method marcasEnComun(unaPersona) = 
		(self.marcasCompradas().intersection(unaPersona.marcasCompradas())).size()
	
	method marcasDiferentes(unaPersona) = 
		(self.marcasCompradas().union(unaPersona.marcasCompradas())).difference(self.marcasCompradas()).size()
	
	
	method esCompatibleCon(unaPersona) =
		self.marcasEnComun(unaPersona) > self.marcasDiferentes(unaPersona)
		
	method carpasEnLaQueCompro() =
		jarrasCompradas.map({j => j.carpa()}).asSet()
		
	method capacidadDeJarrasCompradas() = 
		jarrasCompradas.map({j => j.capacidadLitros()})
	
	method estaEntrandoEnVicio() = 
		(1..self.capacidadDeJarrasCompradas().size() - 1).all({i => self.capacidadDeJarrasCompradas().get(i-1) < self.capacidadDeJarrasCompradas().get(i)})
	
	method totalGastado() =
		jarrasCompradas.sum({j => j.precioDeVenta()})
		
	method jarraMasCaraComprada() =
		jarrasCompradas.max({j => j.precioDeVenta()})
	
	method precioDeJarraMasCaraComprada() =//Este metodo lo hicimos para corroborar el metodo jarraMasCaraComprada()
		self.jarraMasCaraComprada().precioDeVenta()
	
}

object belga{
	method leGustaLaCerveza(marca) = marca.cantidadDeLupulo() > 4
}

object aleman{
	method leGustaLaCerveza(marca) = true
}

object checo{
	method leGustaLaCerveza(marca) = marca.graduacion() > 8
}

