import Marcas.*
import Carpas.*
import Personas.*

object recargoFijo {
	
	method recargo(unaCarpa) = unaCarpa.marca().precio() * 0.30
}

object recargoPorCantidad{
	
	method recargo(unaCarpa) =
		if (unaCarpa.cantidadDePersonasEnLaCarpa() >= (unaCarpa.limiteDeGente() * 0.5))
			unaCarpa.marca().precio() * 0.40
		else
			unaCarpa.marca().precio() * 0.25
}

object recargoPorEbriedad{
	
	method recargo(unaCarpa) =
		if(unaCarpa.cantidadDeBorrachos() >= (unaCarpa.cantidadDePersonasEnLaCarpa() * 0.75))
			unaCarpa.marca().precio() * 0.50
		else
			unaCarpa.marca().precio() * 0.20
}


