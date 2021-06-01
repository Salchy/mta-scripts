------------------------------------------------------------------------------------
--	PROYECTO:			Comunidad Gamers 2.0 (2019)
--	DERECHOS:			Todos los derechos reservados por los desarrolladores
--	ARCHIVO:			CGmarkers/servidor.lua
--	PROPÓSITO:			Sistema para obtener la posicion de markers para futuros sistemas
--	DESARROLLADORES:	Leandro Correa Gimenez (Salchy)
------------------------------------------------------------------------------------

function openGUI(player, cmd)
	local account = getPlayerAccount(player)
	if (isGuestAccount(account)) then
		return false
	end
	local accname = getAccountName(account)
	if (not isObjectInACLGroup("user."..accname, aclGetGroup("Admin"))) then
		return false
	end
	triggerClientEvent(player, "CGmarkers.openGUI", player)
end
addCommandHandler("markers", openGUI)