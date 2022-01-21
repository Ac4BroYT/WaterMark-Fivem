local Time = {}
local timezone = -3

function atualizarHora()
  Time.h = tonumber(os.date("%H", os.time() + timezone * 60 * 60))
  Time.m = tonumber(os.date("%M"))
  Time.s = tonumber(os.date("%S"))
  Time.y = tonumber(os.date("%Y"))
  Time.me = tonumber(os.date("%m"))
  Time.d = tonumber(os.date("%d"))
  if Time.s == 0 and Time.m == 0 then
  end
end

RegisterServerEvent('JNS:requestSync')
AddEventHandler('JNS:requestSync', function()
    TriggerClientEvent('JNS:updateTime', -1, Time.h, Time.m, Time.s, Time.y, Time.me, Time.d)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        atualizarHora()
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        TriggerClientEvent('JNS:updateTime', -1, Time.h, Time.m, Time.s, Time.y, Time.me, Time.d)
    end
end)