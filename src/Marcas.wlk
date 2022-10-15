class Marcas{
	var property cantidadDeLupulo
	const property paisDeOrigen
	var property precio
	
	method graduacion()
	
}

class CervezaRubia inherits Marcas{
	var graduacionRubia
	
	override method graduacion() = graduacionRubia
	
}

class CervezaNegra inherits Marcas{
	var property graduacionReglamentaria
	
	override method graduacion() = graduacionReglamentaria.min(2*cantidadDeLupulo)
}

class CervezaRoja inherits CervezaNegra{
	override method graduacion() = super() * 1.25
}

class Jarra{
	var property capacidadLitros
	const property marcaDeCerveza
	const property carpa
	
	method precioDeVenta() =
		carpa.precioDeVenta() * capacidadLitros
	
	method contenidoAlcoholico() = capacidadLitros * (marcaDeCerveza.graduacion() / 100)
}


