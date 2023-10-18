import pacientes.*

class Aparato {
	var color = "blanco"
	
	method color() = color 
	method usar(unPaciente)
	method puedeUsar(unPaciente)
	method reducirDolorPaciente(unPaciente)
	method aumentarNivelDeFortaleza(unPaciente)
}

class Magneto inherits Aparato {
	
	override method reducirDolorPaciente(unPaciente){
		unPaciente.reducirDolor(unPaciente.nivelDeDolor()*0.1) 
	}
	override method aumentarNivelDeFortaleza(unPaciente){
	}
	
	override method usar(unPaciente){
		self.reducirDolorPaciente(unPaciente)
	}
	override method puedeUsar(unPaciente){
		return true
	}
	
}
class Bicicleta inherits Aparato{
	
	override method reducirDolorPaciente(unPaciente){
		unPaciente.reducirDolor(4)
	}
	override method aumentarNivelDeFortaleza(unPaciente){
		unPaciente.aumentarNivelDeFortaleza(3)
	}
	
	override method usar(unPaciente){
		if(!self.puedeUsar(unPaciente)){
			self.error("no se puede usar este aparato")
		}
		self.reducirDolorPaciente(unPaciente)
		self.aumentarNivelDeFortaleza(unPaciente)
		
	}
	override method puedeUsar(unPaciente){
		return unPaciente.edad() > 8 
	}
}
class Minitramp inherits Aparato{
	
	override method reducirDolorPaciente(unPaciente){
		unPaciente.reducirDolor(4)
	}
	override method aumentarNivelDeFortaleza(unPaciente){
		unPaciente.aumentarNivelDeFortaleza(unPaciente.edad()* 0.1)
	}
	
	override method usar(unPaciente){
		if(!self.puedeUsar(unPaciente)){
			self.error("no se puede usar este aparato")
		}
	self.reducirDolorPaciente(unPaciente)
	self.aumentarNivelDeFortaleza(unPaciente)
			
}
	override method puedeUsar(unPaciente){
		return unPaciente.nivelDeDolor() < 20 
	}
}
