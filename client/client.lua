local znx = {}
local znx_is_shaking = false

znx.ScreenShake = function(znx_intensity)
    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', znx_intensity)
end

lib.onCache('vehicle', function(znx_vehicle)
    if znx_vehicle then
        local znx_prev_health = GetEntityHealth(znx_vehicle)

        while IsPedInAnyVehicle(cache.ped, false) do
            Wait(100)

            local znx_current_health = GetEntityHealth(znx_vehicle)

            if znx_current_health < znx_prev_health and not znx_is_shaking then
                znx.ScreenShake(Zenix.Shake)

                znx_is_shaking = true

                lib.timer(500, function()
                    znx_is_shaking = false
                end)
            end

            znx_prev_health = znx_current_health
        end
    end
end)