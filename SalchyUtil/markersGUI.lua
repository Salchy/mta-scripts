------------------------------------------------------------------------------------
--	PROYECTO:			Comunidad Gamers 2.0 (2019)
--	DERECHOS:			Todos los derechos reservados por los desarrolladores
--	ARCHIVO:			CGSalchyUtil/markersGUI.lua
--	PROPÓSITO:			Sistema para ayudar crear markers, pickups, objetos y peds
--	DESARROLLADORES:	Leandro Correa Gimenez (Salchy)
------------------------------------------------------------------------------------

local x, y = guiGetScreenSize()

local elementos = {}
local markers = {"checkpoint", "ring", "cylinder", "arrow", "corona"}

function createGUI()
	ventana = guiCreateWindow(x - 355, (y / 2) - 142.5, 345, 285, "Herramientas de creación", false)
	guiWindowSetSizable(ventana, false)
	guiSetAlpha(ventana, 0.90)
	guiSetVisible(ventana, false)

	tab = guiCreateTabPanel(10, 24, 325, 220, false, ventana)

	tabs = {}

	tabs["Markers"] = {}
	tabs["Pickups"] = {}
	tabs["Objects"] = {}
	tabs["Peds"] = {}

	tabs["Markers"]["tab"] = guiCreateTab("Marker", tab)
	tabs["Pickups"]["tab"] = guiCreateTab("Pickup", tab)
	tabs["Objects"]["tab"] = guiCreateTab("Objetos", tab)
	tabs["Peds"]["tab"] = guiCreateTab("Peds", tab)

	-- Markers
	tabs["Markers"]["editID"] = guiCreateComboBox(10, 25, 140, 110, "cylinder", false, tabs["Markers"]["tab"])
	for i, v in ipairs(markers) do
		guiComboBoxAddItem(tabs["Markers"]["editID"], v)
	end
	tabs["Markers"]["idLabel"] = guiCreateLabel(15, 2, 135, 20, "ID:", false, tabs["Markers"]["tab"])
	guiLabelSetVerticalAlign(tabs["Markers"]["idLabel"], "center")
	tabs["Markers"]["separador"] = guiCreateLabel(160, 5, 5, 224, "| | | | | | | | | | | |", false, tabs["Markers"]["tab"])
	guiLabelSetHorizontalAlign(tabs["Markers"]["separador"], "left", true)

	tabs["Markers"]["Crear"] = guiCreateButton(10, 60, 140, 28, "Crear", false, tabs["Markers"]["tab"])
	tabs["Markers"]["Borrar"] = guiCreateButton(10, 93, 140, 28, "Borrar", false, tabs["Markers"]["tab"])
	tabs["Markers"]["ObtenerPos"] = guiCreateButton(10, 126, 140, 28, "Obtener posicion", false, tabs["Markers"]["tab"])
	tabs["Markers"]["CrearEnMiPos"] = guiCreateButton(10, 159, 140, 28, "Crear en mi posicion", false, tabs["Markers"]["tab"])
	tabs["Markers"]["Actualizar"] = guiCreateButton(175, 159, 140, 28, "Actualizar", false, tabs["Markers"]["tab"])

	tabs["Markers"]["editX"] = guiCreateEdit(175, 20, 140, 30, "", false, tabs["Markers"]["tab"])
	tabs["Markers"]["editY"] = guiCreateEdit(175, 55, 140, 30, "", false, tabs["Markers"]["tab"])
	tabs["Markers"]["editZ"] = guiCreateEdit(175, 90, 140, 30, "", false, tabs["Markers"]["tab"])
	tabs["Markers"]["tam"] = guiCreateEdit(175, 125, 140, 30, "", false, tabs["Markers"]["tab"])

	addEventHandler("onClientGUIClick", tabs["Markers"]["Crear"], crearElemento, false)
	addEventHandler("onClientGUIClick", tabs["Markers"]["Borrar"], borrarElemento, false)
	addEventHandler("onClientGUIClick", tabs["Markers"]["ObtenerPos"], obtenerPosicion, false)
	addEventHandler("onClientGUIClick", tabs["Markers"]["CrearEnMiPos"], crearElemento2, false)
	addEventHandler("onClientGUIClick", tabs["Markers"]["Actualizar"], actualizarElemento, false)
	addEventHandler("onClientGUIChanged", tabs["Markers"]["editX"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Markers"]["editY"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Markers"]["editZ"], removeLetters, false)

	-- Pickups
	tabs["Pickups"]["editID"] = guiCreateEdit(10, 25, 140, 30, "1272", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["idLabel"] = guiCreateLabel(15, 2, 135, 20, "ID:", false, tabs["Pickups"]["tab"])
	guiLabelSetVerticalAlign(tabs["Pickups"]["idLabel"], "center")
	tabs["Pickups"]["separador"] = guiCreateLabel(160, 5, 5, 224, "| | | | | | | | | | | |", false, tabs["Pickups"]["tab"])
	guiLabelSetHorizontalAlign(tabs["Pickups"]["separador"], "left", true)

	tabs["Pickups"]["Crear"] = guiCreateButton(10, 60, 140, 28, "Crear", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["Borrar"] = guiCreateButton(10, 93, 140, 28, "Borrar", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["ObtenerPos"] = guiCreateButton(10, 126, 140, 28, "Obtener posicion", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["CrearEnMiPos"] = guiCreateButton(10, 159, 140, 28, "Crear en mi posicion", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["Actualizar"] = guiCreateButton(175, 159, 140, 28, "Actualizar", false, tabs["Pickups"]["tab"])

	tabs["Pickups"]["editX"] = guiCreateEdit(175, 25, 140, 30, "", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["editY"] = guiCreateEdit(175, 60, 140, 30, "", false, tabs["Pickups"]["tab"])
	tabs["Pickups"]["editZ"] = guiCreateEdit(175, 95, 140, 30, "", false, tabs["Pickups"]["tab"])

	addEventHandler("onClientGUIClick", tabs["Pickups"]["Crear"], crearElemento, false)
	addEventHandler("onClientGUIClick", tabs["Pickups"]["Borrar"], borrarElemento, false)
	addEventHandler("onClientGUIClick", tabs["Pickups"]["ObtenerPos"], obtenerPosicion, false)
	addEventHandler("onClientGUIClick", tabs["Pickups"]["CrearEnMiPos"], crearElemento2, false)
	addEventHandler("onClientGUIClick", tabs["Pickups"]["Actualizar"], actualizarElemento, false)
	addEventHandler("onClientGUIChanged", tabs["Pickups"]["editX"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Pickups"]["editY"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Pickups"]["editZ"], removeLetters, false)

	-- Objects
	tabs["Objects"]["editID"] = guiCreateEdit(10, 25, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["idLabel"] = guiCreateLabel(15, 2, 135, 20, "ID:", false, tabs["Objects"]["tab"])
	guiLabelSetVerticalAlign(tabs["Objects"]["idLabel"], "center")
	tabs["Objects"]["separador"] = guiCreateLabel(160, 5, 5, 224, "| | | | | | | | | | | |", false, tabs["Objects"]["tab"])
	guiLabelSetHorizontalAlign(tabs["Objects"]["separador"], "left", true)

	tabs["Objects"]["Crear"] = guiCreateButton(10, 60, 140, 28, "Crear", false, tabs["Objects"]["tab"])
	tabs["Objects"]["Borrar"] = guiCreateButton(10, 93, 140, 28, "Borrar", false, tabs["Objects"]["tab"])
	tabs["Objects"]["ObtenerPos"] = guiCreateButton(10, 126, 140, 28, "Obtener posicion", false, tabs["Objects"]["tab"])
	tabs["Objects"]["Actualizar"] = guiCreateButton(10, 159, 140, 28, "Actualizar", false, tabs["Objects"]["tab"])

	tabs["Objects"]["editX"] = guiCreateEdit(175, 6, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["editY"] = guiCreateEdit(175, 36, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["editZ"] = guiCreateEdit(175, 66, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["editRX"] = guiCreateEdit(175, 96, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["editRY"] = guiCreateEdit(175, 126, 140, 30, "", false, tabs["Objects"]["tab"])
	tabs["Objects"]["editRZ"] = guiCreateEdit(175, 156, 140, 30, "", false, tabs["Objects"]["tab"])

	addEventHandler("onClientGUIClick", tabs["Objects"]["Crear"], crearElemento, false)
	addEventHandler("onClientGUIClick", tabs["Objects"]["Borrar"], borrarElemento, false)
	addEventHandler("onClientGUIClick", tabs["Objects"]["ObtenerPos"], obtenerPosicion, false)
	addEventHandler("onClientGUIClick", tabs["Objects"]["Actualizar"], actualizarElemento, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editX"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editY"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editZ"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editRX"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editRY"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Objects"]["editRZ"], removeLetters, false)

	-- Peds
	tabs["Peds"]["editID"] = guiCreateEdit(10, 25, 140, 30, "", false, tabs["Peds"]["tab"])
	tabs["Peds"]["idLabel"] = guiCreateLabel(15, 2, 135, 20, "ID:", false, tabs["Peds"]["tab"])
	guiLabelSetVerticalAlign(tabs["Peds"]["idLabel"], "center")
	tabs["Peds"]["separador"] = guiCreateLabel(160, 5, 5, 224, "| | | | | | | | | | | |", false, tabs["Peds"]["tab"])
	guiLabelSetHorizontalAlign(tabs["Peds"]["separador"], "left", true)

	tabs["Peds"]["Crear"] = guiCreateButton(10, 60, 140, 28, "Crear", false, tabs["Peds"]["tab"])
	tabs["Peds"]["Borrar"] = guiCreateButton(10, 93, 140, 28, "Borrar", false, tabs["Peds"]["tab"])
	tabs["Peds"]["ObtenerPos"] = guiCreateButton(10, 126, 140, 28, "Obtener posicion", false, tabs["Peds"]["tab"])
	tabs["Peds"]["Actualizar"] = guiCreateButton(10, 159, 140, 28, "Actualizar", false, tabs["Peds"]["tab"])

	tabs["Peds"]["editX"] = guiCreateEdit(175, 20, 140, 30, "", false, tabs["Peds"]["tab"])
	tabs["Peds"]["editY"] = guiCreateEdit(175, 55, 140, 30, "", false, tabs["Peds"]["tab"])
	tabs["Peds"]["editZ"] = guiCreateEdit(175, 90, 140, 30, "", false, tabs["Peds"]["tab"])
	tabs["Peds"]["editRZ"] = guiCreateEdit(175, 125, 140, 30, "", false, tabs["Peds"]["tab"])

	addEventHandler("onClientGUIClick", tabs["Peds"]["Crear"], crearElemento, false)
	addEventHandler("onClientGUIClick", tabs["Peds"]["Borrar"], borrarElemento, false)
	addEventHandler("onClientGUIClick", tabs["Peds"]["ObtenerPos"], obtenerPosicion, false)
	addEventHandler("onClientGUIClick", tabs["Peds"]["Actualizar"], actualizarElemento, false)
	addEventHandler("onClientGUIChanged", tabs["Peds"]["editX"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Peds"]["editY"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Peds"]["editZ"], removeLetters, false)
	addEventHandler("onClientGUIChanged", tabs["Peds"]["editRZ"], removeLetters, false)

	exportarElementobtn = guiCreateButton(10, 250, 105, 26, "Exportar posicion", false, ventana)
	borrarTodo = guiCreateButton(120, 250, 105, 26, "Borrar todor", false, ventana)
	cerrarGUIbtn = guiCreateButton(230, 250, 105, 26, "Cerrar", false, ventana)

	addEventHandler("onClientGUIClick", cerrarGUIbtn, cerrarGUI, false)
	addEventHandler("onClientGUIClick", borrarTodo, borrarElementos, false)
	addEventHandler("onClientGUIClick", exportarElementobtn, exportarElemento, false)

	bindKey("lalt", "both", toggleCamara)
end

function getActiveTab()
	local active = guiGetSelectedTab(tab)
	if (active == tabs["Markers"]["tab"]) then
		return "Markers"
	elseif (active == tabs["Pickups"]["tab"]) then
		return "Pickups"
	elseif (active == tabs["Objects"]["tab"]) then
		return "Objects"
	elseif (active == tabs["Peds"]["tab"]) then
		return "Peds"
	end
	return false
end

function removeLetters(element)
	local txt = guiGetText(element)
	local removed = string.gsub(txt, "[^0-9-.]", "")
	if (removed ~= txt) then
		guiSetText(element, removed)
	end
end

function crearElemento()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	local x, y, z = guiGetText(tabs[area]["editX"]), guiGetText(tabs[area]["editY"]), guiGetText(tabs[area]["editZ"])
	if (x == "" or y == "" or z == "") then
		outputChatBox("Debes ingresar las coordenadas X, Y, Z.", 255, 0, 0)
		return false
	end
	if (elementos[area] and isElement(elementos[area])) then
		destroyElement(elementos[area])
		elementos[area] = nil
	end
	local tipo = guiGetText(tabs[area]["editID"])
	if (area == "Markers") then
		local tipo = guiComboBoxGetItemText(tabs[area]["editID"], guiComboBoxGetSelected(tabs[area]["editID"]))
		elementos[area] = createMarker(tonumber(x), tonumber(y), tonumber(z), tipo, 1.5, 255, 0, 0, 255)
	elseif (area == "Pickups") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		elementos[area] = createPickup(x, y, z, 3, tonumber(tipo), 0)
	elseif (area == "Objects") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		local rx, ry, rz = guiGetText(tabs[area]["editRX"]) or 0, guiGetText(tabs[area]["editRY"]) or 0, guiGetText(tabs[area]["editRZ"]) or 0
		elementos[area] = createObject(tonumber(tipo), tonumber(x), tonumber(y), tonumber(z), tonumber(rx), tonumber(ry), tonumber(rz))
	elseif (area == "Peds") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		local rz = guiGetText(tabs[area]["editRZ"]) or 0
		elementos[area] = createPed(tonumber(tipo), tonumber(x), tonumber(y), tonumber(z), tonumber(rz))
	end
	local dim, int = getElementDimension(localPlayer), getElementInterior(localPlayer)
	setElementDimension(elementos[area], dim)
	setElementInterior(elementos[area], int)
end

function borrarElemento()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	if (elementos[area] and isElement(elementos[area])) then
		destroyElement(elementos[area])
		elementos[area] = nil
	end
end

function obtenerPosicion()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	local x, y, z = getElementPosition(localPlayer)
	local rx, ry, rz = getElementRotation(localPlayer)
	local x, y, z = string.format("%.3f", x), string.format("%.3f", y), string.format("%.3f", z)
	local rx, ry, rz = string.format("%.3f", rx), string.format("%.3f", ry), string.format("%.3f", rz)
	guiSetText(tabs[area]["editX"], x)
	guiSetText(tabs[area]["editY"], y)
	guiSetText(tabs[area]["editZ"], z)
	if (tabs[area]["editRX"]) then
		guiSetText(tabs[area]["editRX"], rx)
	end
	if (tabs[area]["editRY"]) then
		guiSetText(tabs[area]["editRY"], ry)
	end
	if (tabs[area]["editRZ"]) then
		guiSetText(tabs[area]["editRZ"], rz)
	end
end

function crearElemento2()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	if (elementos[area] and isElement(elementos[area])) then
		destroyElement(elementos[area])
		elementos[area] = nil
	end
	local x, y, z = getElementPosition(localPlayer)
	local tipo = guiGetText(tabs[area]["editID"])
	if (area == "Markers") then
		local tipo = guiComboBoxGetItemText(tabs[area]["editID"], guiComboBoxGetSelected(tabs[area]["editID"]))
		local tam = guiGetText(tabs[area]["tam"]) or 1.5
		elementos[area] = createMarker(x, y, z, tipo, tonumber(tam), 255, 0, 0, 255)
	elseif (area == "Pickups") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		elementos[area] = createPickup(x, y, z, 3, tonumber(tipo), 0)
	end
	local dim, int = getElementDimension(localPlayer), getElementInterior(localPlayer)
	setElementDimension(elementos[area], dim)
	setElementInterior(elementos[area], int)
end

function actualizarElemento()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	if (not elementos[area] or not isElement(elementos[area])) then
		outputChatBox("No hay un elemento "..area.." creado.", 255, 0, 0)
		return false
	end
	if (elementos[area] and isElement(elementos[area])) then
		destroyElement(elementos[area])
		elementos[area] = nil
	end
	local x, y, z = tonumber(guiGetText(tabs[area]["editX"])), tonumber(guiGetText(tabs[area]["editY"])), tonumber(guiGetText(tabs[area]["editZ"]))
	if (tabs[area]["editRZ"]) then
		local rot = guiGetText(tabs[area]["editRZ"])
	end
	local tipo = guiGetText(tabs[area]["editID"])
	if (area == "Markers") then
		local tipo = guiComboBoxGetItemText(tabs[area]["editID"], guiComboBoxGetSelected(tabs[area]["editID"]))
		local tam = guiGetText(tabs[area]["tam"]) or 1.5
		elementos[area] = createMarker(x, y, z, tipo, tonumber(tam), 255, 0, 0, 255)
	elseif (area == "Pickups") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		elementos[area] = createPickup(x, y, z, 3, tonumber(tipo), 0)
	elseif (area == "Objects") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		local rx, ry, rz = guiGetText(tabs[area]["editRX"]) or 0, guiGetText(tabs[area]["editRY"]) or 0, guiGetText(tabs[area]["editRZ"]) or 0
		elementos[area] = createObject(tonumber(tipo), tonumber(x), tonumber(y), tonumber(z), tonumber(rx), tonumber(ry), tonumber(rz))
	elseif (area == "Peds") then
		if (not tonumber(tipo)) then
			outputChatBox("Debes ingresar una ID de modelo válida.", 255, 0, 0)
			return false
		end
		local rz = guiGetText(tabs[area]["editRZ"]) or 0
		elementos[area] = createPed(tonumber(tipo), tonumber(x), tonumber(y), tonumber(z), tonumber(rz))
	end
	local dim, int = getElementDimension(localPlayer), getElementInterior(localPlayer)
	setElementDimension(elementos[area], dim)
	setElementInterior(elementos[area], int)
end

function openGUI()
	if (not ventana) then
		createGUI()
	end
	guiSetVisible(ventana, not guiGetVisible(ventana))
	showCursor(guiGetVisible(ventana))
end
addEvent("CGSalchyUtil.openGUI", true)
addEventHandler("CGSalchyUtil.openGUI", root, openGUI)

function cerrarGUI()
	guiSetVisible(ventana, false)
	showCursor(false)
end

function borrarElementos()
	for k,v in pairs(elementos) do
		destroyElement(v)
	end
	elementos = {}
end

function toggleCamara(key, state)
	if (guiGetVisible(ventana)) then
		if (state == "down") then
			showCursor(false)
		else
			showCursor(true)
		end
	end
end

function exportarElemento()
	local area = getActiveTab()
	if (not area) then
		return false
	end
	if (not elementos[area]) then
		return false
	end
	local x, y, z = getElementPosition(elementos[area])
	local rx, ry, rz = getElementRotation(elementos[area])
	local x, y, z = string.format("%.3f", x), string.format("%.3f", y), string.format("%.3f", z)
	if (area == "Markers" or area == "Pickups") then
		outputChatBox(x..", "..y..", "..z)
	elseif (area == "Objects") then
		local rx, ry, rz = string.format("%.3f", rx), string.format("%.3f", ry), string.format("%.3f", rz)
		outputChatBox(x..", "..y..", "..z..", "..rx..", "..ry..", "..rz)
	elseif (area == "Peds") then
		local rz = string.format("%.3f", rz)
		outputChatBox(x..", "..y..", "..z..", "..rz)
	end
end