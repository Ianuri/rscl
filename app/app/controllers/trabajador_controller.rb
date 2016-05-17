class TrabajadorController < ApplicationController
	
	#get trabajadores
	def index
		@trabajadores = Trabajador.all

	end

	#get trabajadores/:id
	def show
		@trabajadores = Trabajador.find_by idTrabajador: '1'
	end

	#get trabajadores/new
	def new
		#Guarda lo q reciba en una memoria temporal, no es q este en la bd 
		@trabajadores = Trabajador.new
	end	

	#Procedimiento para registrar con POST/trabajador
	def create
		#@trabajador = Trabajador.new(nombres: )
		@trabajador = Trabajador.new()
	end

end