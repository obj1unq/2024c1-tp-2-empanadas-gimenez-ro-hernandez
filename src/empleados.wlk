object galvan {
	var sueldo = 15000
	var saldo = 0
	method sueldo(_sueldo){ //setter cambias la variable. se llama igual q la variable q modif. si tenes q hacer calculo, ahi le pones otro nombre. 
		sueldo = _sueldo //
	}	
	method sueldo(){ //getter
		return sueldo
	}
	method cobrarSueldo(){
		//lo hago, aunque no haga nada, para respetar el polimorfismo
		//puedo dejar vacio porque es un mensaje de orden. (NO ASI EN UN MENSAJE DE CONSULTA)
		saldo += sueldo
		
	}
	method totalDeuda(){
		return if (saldo<0) saldo.abs() else 0 // o saldo * -1
	}
	method totalDinero(){
		return if (saldo>0) saldo else 0 
	}
	method gastar(cuanto){
		saldo -= cuanto
	}
}

object baigorria {
	var precioEmpanada = 15
	var empanadasVendidas = 0
	var totalCobrado = 0
	
	method sueldo(){ // mensaje de consulta. va con return
		return empanadasVendidas * precioEmpanada
	}
	method precioEmpanada(_precioEmpanada){
		precioEmpanada = _precioEmpanada
	}
	method empanadasVendidas(_empanadasVendidas){
		empanadasVendidas = empanadasVendidas + _empanadasVendidas
	}
	method cobrarSueldo(){
		totalCobrado = totalCobrado + self.sueldo()
		empanadasVendidas = 0
	}
	method totalCobrado(){
		return totalCobrado
	}
}

object gimenez {
	var fondo = 300000
	method pagarA(empleado){
		fondo -= empleado.sueldo() // polimorfismo (dos objetos son polimorficos en algún mensaje, aunq el metodo sea distinto). no importa el argumento, el metodo tiene que seguir funcionando (a nivel mensaje)
		empleado.cobrarSueldo()		//hay algo que necesito decirle a todos y que todos lo entiendan
	}
	method fondo(){//getter
		return fondo
	}
}	

