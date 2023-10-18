import aparatos.*

class Paciente {
	
	var edad
	var nivelDeFortalezaMuscular
	var nivelDeDolor
	const rutina=[]
	
	method usarAparato(unAparato){
		unAparato.usar(self)
	}
	method puedeUsarAparato(unAparato){
		unAparato.puedeUsar(self)
	}
	method nivelDeDolor(){
		return nivelDeDolor
	}	
	method nivelDeFortalezaMuscular(){
		return nivelDeFortalezaMuscular
	}
	method reducirDolor(unaCantidad){
		nivelDeDolor = 0.max(nivelDeDolor - unaCantidad)	
	}
	method aumentarNivelDeFortaleza(unaCantidad){
		nivelDeFortalezaMuscular = nivelDeFortalezaMuscular + unaCantidad
	}
	method edad(){
		return edad
	}
	method hacerRutina(){
		if(self.puedeHacerRutina()){
		rutina.forEach(	{ap => self.usarAparato(ap)}	)
		}
	}
	method puedeHacerRutina(){
		return rutina.all(	{ap => ap.puedeUsar(self)}	)
	}
	method agregarAparatosARutina(unAparato){
		rutina.add(unAparato)
	}
	method rutina(){
		return rutina
	}
	
}


class  Resistente inherits Paciente{
		
	override method aumentarNivelDeFortaleza(unaCantidad){
		 super(unaCantidad + 1 )
	}	
	
}

class  Caprichoso inherits Paciente{
	
	method condicionAdicional() = self.puedeHacerRutina() 
	
	method algunoEsRojo(){
		return 	rutina.any({ap => ap.color() == "rojo"})
	}
	
	override method puedeHacerRutina(){
		return super() && self.algunoEsRojo()
	}
	override method hacerRutina(){
		super()
		super()
	}

}
class RapidaRecuperacion inherits Paciente{
	
	override method hacerRutina(){
		super()
		self.reducirDolor(nivelRecuperacion.nivel())
	}
		
}

object 	nivelRecuperacion{
	var property nivel=3
	
}

