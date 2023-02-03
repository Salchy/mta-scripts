------------------------------------------------------------------------------------
--	PROYECTO:			Comunidad Gamers 3.0 (2021)
--	DERECHOS:			Todos los derechos reservados por los desarrolladores
--	ARCHIVO:			CGmisc/misc.lua
--	PROPÓSITO:			Funciones útiles y alguna que otra misc
--	DESARROLLADORES:	Leandro Correa Gimenez (Salchy)
------------------------------------------------------------------------------------

local meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"}

function getMonthName(month)
	assert(month == "number", "getMonthName esperaba un number como argumento 1")

	if (not meses[mes]) then
		return false
	end
	return meses[mes]
end

function getDateAndTime(monthName)
	local realTime = getRealTime()
	local year = realTime["year"] + 1900
	local month = realTime["month"] + 1
	local day = realTime["monthday"]
	local hour = realTime["hour"]
	local minute = realTime["minute"]
	local seconds = realTime["second"]

	if (monthName) then
		month = getMonthName(month)
	else
		month = string.format("%02d", month)
	end

	local hour, minute, seconds = string.format("%02d", hour), string.format("%02d", minute), string.format("%02d", seconds)
	local day = string.format("%02d", day)
	return day, month, year, hour, minute, seconds
end