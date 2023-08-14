Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        local spawnCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, math.random(-50, 50) + 0.0, 0.0)
        local ground, spawnZ = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z, 0)
        spawnCoords.z = spawnZ
        
        if IsModelValid(Config.BunnyModel) then
            RequestModel(Config.BunnyModel)
            while not HasModelLoaded(Config.BunnyModel) do
                Citizen.Wait(0)
            end
            
            local bunny = CreatePed(28, Config.BunnyModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, true, false)
            SetEntityAsNoLongerNeeded(bunny)
            SetEntityInvincible(bunny, true)
        end
    end
end)
