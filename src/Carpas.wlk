import Marcas.*
import Personas.*
import Recargos.*

class Carpas{
	var property limiteDeGente
	var property tieneBandaTradicional
	const property marca
	const property personasAca = []
	var cantidadVendidas = 0
	var recargoDado 
	
	
	
	method ingresarPersona(unaPersona){
		if(unaPersona.puedeEntrar(self))
			personasAca.add(unaPersona)
		else
			self.error("No puede ingresar")
	}
	
	method cantidadDePersonasEnLaCarpa() = personasAca.size()
	
	method cantidadEsPar() = self.cantidadDePersonasEnLaCarpa().even()
	
	method dejaIngresar(unaPersona) =
		self.cantidadDePersonasEnLaCarpa() < limiteDeGente and not unaPersona.estaEbrio()
		
	method estaEnLaCarpa(unaPersona) = personasAca.contains(unaPersona)
	
	method servirJarra(unaPersona, capacidad){
		if (self.estaEnLaCarpa(unaPersona)){
			cantidadVendidas++
			unaPersona.comprarCerveza(new Jarra(capacidadLitros = capacidad, marcaDeCerveza = marca, carpa = self))
			}
		else{
			self.error("La persona no se encuentra en la carpa")
			}
	}
	
	method cantidadDeBorrachos() =
		personasAca.count({b => b.estaEbrio()})
	
	
	method cantidadDeBorrachosEmpedernidos() =
		personasAca.count({b => b.esBorrachoEmpedernido()})
	
	
	method nacionalidadesEnCarpa() =
		personasAca.map({p => p.nacionalidad()}).asSet()
	
	method esHomogenea() =
		self.nacionalidadesEnCarpa().size() == 1
	
	method personasQueNoCompraronAca() =
		personasAca.filter({p => not p.carpasEnLaQueCompro().contains(self)})
	
	method precioDeVenta() = marca.precio() + recargoDado.recargo(self)
	
}
