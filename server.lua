--Private Messages
RegisterCommand('md', function(source, args)
    if tonumber(args[1]) == nil then
        TriggerClientEvent("chatMessage", source, "SISTEMA", {255, 0, 0}, "¡No has indicado ninguna ID!")
    else
        if GetPlayerName(tonumber(args[1])) then
            local player = tonumber(args[1])
            TriggerEvent("vorp:getCharacter", player, function(target)
                -- Jugador que recibe el mensaje
                TriggerClientEvent("chatMessage", player, "Privado", {214, 214, 214}, "^2 De ^5" .. GetPlayerName(source) .. " [" .. source .. "]: ^7" .. createmessage(args))
                -- Jugador que manda el mensaje
                TriggerClientEvent("chatMessage", source, "Privado", {214, 214, 214}, "^3 Enviado a ^5" .. GetPlayerName(player) .. ": ^7" .. createmessage(args))
            end)
        else
            TriggerClientEvent("chatMessage", source, "SISTEMA", {255, 0, 0}, "¡ID de jugador incorrecto!")
        end
    end
end)

function createmessage(args)
   local msg = ""
   for i = 2, #args, 1 do
   msg = msg .. args[i] .. " "
   end
   return msg  
end
