Citizen.CreateThread(function()
  if Config.target == "qb" then
    exports['qb-target']:AddBoxZone("ChopShopParts", vector3(471.5797, -1312.1295, 30.2579), 1.40, 1.35, {
      name="ChopShopParts",
      heading=113.1992,
      debugPoly=false,
      minZ=28.77834,
      maxZ=29.87834,
      }, {
    options = {
      {
        type = "client",
        event = "qb-chopshop:StartMenu",
        icon = "fas fa-hammer",
        label = "Chop Parts",
        job = all,
      },
    },
    distance = 3.5
    })

    exports['qb-target']:SpawnPed({
      [1] = {
          model = 'csb_prologuedriver',
          coords = Config.StartLoc,
          minusOne = true,
          freeze = true,
          invincible = true,
          blockevents = true,
          scenario = 'WORLD_HUMAN_CLIPBOARD',
          target = {
            options = {
              {
                type = "client",
                event = "qb-chopshop:jobaccept",
                icon = 'fas fa-car',
                label = 'Locate A Vehicle',
              }
            },
            distance = 1.5,
          }
      }
      })
    --[[elseif Config.target == "bt" then 
      exports['bt-target']:AddBoxZone("ChopShopParts", vector3(471.5797, -1312.1295, 30.2579), 1.40, 1.35, {
        name="ChopShopParts",
        heading=113.1992,
        debugPoly=false,
        minZ=28.77834,
        maxZ=29.87834,
        }, {
      options = {
        {
          type = "client",
          event = "qb-chopshop:StartMenu",
          icon = "fas fa-hammer",
          label = "Chop Parts",
          job = {"all"},
        },
      },
      distance = 3.5
      })

      exports['bt-target']:AddBoxZone("ChopShopStart", vector3(-552.0936, -1792.5475, 22.3643), 1.40, 1.35, {
        name="ChopShopStart",
        heading=113.1992,
        debugPoly=false,
        minZ=22.3643-1,
        maxZ=22.3643+1,
        }, {
      options = {
          {
            type = "client",
            event = "qb-chopshop:jobaccept",
            icon = 'fas fa-car',
            label = 'Locate A Vehicle',
            job = {"all"},
          }
        },
      distance = 3.5
      })]]--
      
    end
end)