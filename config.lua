Config = {}
Config.Language = "en"
Config.Debug = true -- This enables debugging prints.
Config.RenderDistance = 100.0
Config.InteractDistance = 2.0
Config.UseTarget = true -- This enables the use of the target system when available.
Config.ImageDirectory = "nui://ox_inventory/web/images/"
Config.ImageExtension = "png"
Config.WeaponsAreItems = true -- This enables the use of weapons as items. If set to false, weapons will be treated as items and not as weapons.
Config.TeleportEscortIntoSeat = false -- This enables the teleportation of the escort to the seat of the vehicle. Default animates entry / exit.
Config.DefaultJob = { name = "unemployed", level = 0, usePrefixDuty = false } -- The job to set players to when they clock off-duty. usePrefixDuty is used to determine if the job should be prefixed with "off" when they clock off-duty.
-- Photo hosting credentials and response parsing are configured only in config_sv.lua.

Config.Finance = {
    disableWithdraw = false, -- When true, the department will not be able to withdraw money from the department's funds.
    deductCostsFromDepartment = true, -- When true, the costs will be deducted from the department's funds - otherwise it will be deducted from the player's funds.
    deductSalaryFromDepartment = true, -- When true, the salary will be deducted from the department's funds - if it is too much it will not pay. False pays out without deducting.
    maxRankSalary = 10000, -- The maximum salary a rank can have.
    salarySchedule = "*/15 * * * *", -- The CRON schedule at which the salary will be paid. Default is every 15 minutes.
    funding = 100000, -- The amount of money to fund the department with per schedule.
    fundingSchedule = "*/15 * * * *", -- The CRON schedule at which the funding will be paid. Default is every 15 minutes.
    maxTransactions = 100, -- The maximum number of transactions to store per department.
}

Config.Currency = { currency = "USD", countryCode = "en-US" } -- Look up JS currency and countryCode variables for more options. 

Config.CommandClocking = {
    enabled = true, -- set to false to disable commands
    clockin = "clockin", -- command to clockin
    clockout = "clockout", -- command to clockout
}

-- The above should always be configured before using the resource.

Config.DepartmentBlip = {
    sprite = 137,
    color = 0,
    scale = 0.75,
    category = 41
}

Config.Peds = {
    {
        label = "Male Officer #1",
        model = "s_m_m_cop_01",
        pedComponents = {
            {id = 0, drawable = 3, texture = 0}, -- Head
            {id = 1, drawable = 1, texture = 0}, -- Beard
            {id = 2, drawable = 3, texture = 0}, -- Hair   
            {id = 3, drawable = 1, texture = 0}, -- Upper
            {id = 4, drawable = 0, texture = 0}, -- Lower
            {id = 5, drawable = 0, texture = 0}, -- Hand
            {id = 6, drawable = 1, texture = 0}, -- Feet
            {id = 7, drawable = 2, texture = 0}, -- Teeth
            {id = 8, drawable = 3, texture = 0}, -- Accessories
            {id = 9, drawable = 0, texture = 0}, -- Task
            {id = 10, drawable = 1, texture = 0}, -- Decals
            {id = 11, drawable = 1, texture = 0}, -- Torso
        }
    },
    {
        label = "Female Officer #1",
        model = "s_f_y_cop_01",
        pedComponents = {
            {id = 0, drawable = 2, texture = 0}, -- Head
            {id = 1, drawable = 0, texture = 0}, -- Beard
            {id = 2, drawable = 2, texture = 0}, -- Hair   
            {id = 3, drawable = 3, texture = 0}, -- Upper
            {id = 4, drawable = 1, texture = 0}, -- Lower
            -- {id = 5, drawable = 0, texture = 0}, -- Hand
            {id = 6, drawable = 1, texture = 0}, -- Feet
            {id = 7, drawable = 2, texture = 0}, -- Teeth
            {id = 8, drawable = 3, texture = 0}, -- Accessories
            -- {id = 9, drawable = 0, texture = 0}, -- Task
            {id = 10, drawable = 0, texture = 0}, -- Decals
            {id = 11, drawable = 0, texture = 0}, -- Torso
        },
    },
}

Config.AdminGroups = {
    "qbcore.admin",
    "qbcore.god",
    "god",
    "admin",
    "mod",
    "superadmin",
}

Config.TargetIcons = {
    frontdesk = "fas fa-shield-alt",
    stab_sticks = "fas fa-road-barrier",
    escort = "fas fa-people-pulling",
    drag = "fas fa-people-pulling",
    vehicleseat = "fas fa-car",
    handcuffs = "fas fa-handcuffs",
    grappler = "fas fa-road-barrier",
    objects = "fas fa-box",
    evidence_camera = "fas fa-camera",
    breathalyzer = "fas fa-vial",
    search = "fas fa-search",
    fingerprint_scanner = "fas fa-fingerprint",
    gsr_scanner = "fas fa-fingerprint",
    fines = "fas fa-money-bill-wave",
    shields = "fas fa-shield-alt",
    snakecam = "fas fa-camera",
    jail = "fas fa-lock",
    evidence_pickup = "fas fa-broom",
    id_card = "fas fa-id-card",
    vehicle_interact = "fas fa-car",
    locker = "fas fa-box",
    blood_test = "fas fa-vial",
}

Config.FrameworkSettings = {
    dirtyMoney = "DEFAULT",
    usableItemMetadata = function(item, data)
        if type(data) == "table" and data.metadata then return data.metadata end
        if type(item) == "table" and item.metadata then return item.metadata end
        if type(data) == "table" and data.info then return data.info end
        if type(item) == "table" and item.info then return item.info end
        print("^1ERROR: METADATA IS WRONGLY CONFIGURED, CHECK CONFIG.LUA:^0", item, data)
    end
}

Config.IsPlayerDead = function()
    if GetResourceState("op_ambulance") == "started" then
        return exports.op_ambulance:isPlayerDead()
    end
    return IsEntityDead(PlayerPedId())
end

Config.GiveKeys = function(vehicle, plate)
    -- Replace this line with your export / event to give keys for your vehicle.
end

Config.PoliceJobs = { -- You can use multiple departments with the same job, no need to add anything here if you don't want to.
    ["police"] = { -- The framework's job name, used in /setjob.
        label = "Police",
        maxLevel = 15, -- The leader's rank will be set to this level, ranks lower than the leader will be 0 through to one level below the leader.
    },
    ["sheriff"] = { -- The framework's job name, used in /setjob.
        label = "Blaine County Sheriff's Office",
        maxLevel = 15, -- The leader's rank will be set to this level, ranks lower than the leader will be 0 through to one level below the leader.
    },
}

Config.Jail = {
    enabled = true,
    maxJailTime = 120, -- The maximum amount of time a player can be jailed for.
}

Config.Fines = {
    enabled = true,
    maxFineAmount = 100000,
    viewFinesCommand = "fines",
}

-- Actions / Evidence

Config.Handcuffs = {
    item = {
        name = "handcuffs", -- The name of the item to use for the cuffs.
        required = true, -- Only set this to true if the item is required to use the cuffs.
    },
    allowResist = true,
    resistSkillCheck = {
        length = 5,
        availableSteps = {'easy', 'medium', 'hard', 'hard', 'hard'},
        availableControls = {'e'},
    },
    lockpickItem = "bobby_pins", -- set to nil (not "nil") to disable lockpicking of cuffs.
    lockpickRemoveChance = 100, -- The chance to remove the lockpick when lockpicking, if set to 100 then it will always remove the lockpick.
    skillCheck = {
        length = 5,
        availableSteps = {'medium', 'medium', 'medium', 'medium', 'hard'},
        availableControls = {'e'},
    },
}

Config.StabSticks = {
    enabled = true,
    item = {
        name = "stab_sticks", -- The name of the item to use for the stab sticks.
        required = true, -- Only set this to true if the item is required to use the stab sticks.
        remove = true, -- Only set this to true if the item is removed when the stab sticks are deployed.
    },
    renderDistance = 200.0, -- The distance at which the stab sticks will be rendered. Leave this alone please.
    burstDamage = 800.0, -- The damage to apply to the vehicle when a stab stick is deployed. Don't set this above 1000.0
    maxLength = 10, -- The maximum length of the stab sticks that can be deployed.
}

Config.Grappler = {
    enabled = true,
    item = {
        name = "grappler", -- The name of the item to use for the grappler.
        required = true, -- Only set this to true if the item is required to use the grappler.
        remove = true, -- Only set this to true if the item is removed when the grappler is deployed.
    },
    breakTimer = 0, -- The timer in seconds that the player will need to wait before breaking the grappler. Set to less than or equal to 0 to disable.
    renderDistance = 100.0, -- The distance at which the grappler will be rendered. Leave this alone please.
}

Config.Evidence = {
    enabled = true,
    pickupCooldown = 0, -- The cooldown in seconds that the player will need to wait before picking up evidence.
    evidenceRemove = 120 * 15, -- The duration in seconds that the evidence will be removed after. 0 = never remove (not reccomended).
    gsrDuration = 60 * 15, -- The duration in seconds that the GSR will be tracked for. 60 * 1 = 1 minute.
    waterDuration = 10, -- The duration in seconds that the GSR will need to be wiped off for when in water. 60 * 1 = 1 minute.
    evidenceExclusionZones = { -- Areas that don't drop evidence.
        {coords = vector3(401.0586, -1132.2800, 29.4586), radius = 10.0},
    },
    evidenceRemoveSkillcheck = {
        length = 5,
        availableSteps = {'medium', 'medium', 'medium', 'medium', 'medium'},
        availableControls = {'e'},
    },
    cameraItem = {
        name = "evidence_camera", -- The name of the item to use for the camera.
        required = true, -- Only set this to true if the item is required to use the camera.
    },
    gsrItem = {
        name = "gsr", -- The name of the item to use for the GSR.
        required = true, -- Only set this to true if the item is required to use the GSR.
    },
    breathalyzerItem = {
        name = "breathalyzer", -- The name of the item to use for the breathalyzer.
        required = true, -- Only set this to true if the item is required to use the breathalyzer.
    },
    fingerprintScannerItem = {
        name = "fingerprint_scanner", -- The name of the item to use for the fingerprint scanner.
        required = true, -- Only set this to true if the item is required to use the fingerprint scanner.
    },
    bloodTestItem = {
        name = "blood_test", -- The name of the item to use for the blood test.
        required = true, -- Only set this to true if the item is required to use the blood test.
    },
    renderDistance = 25.0, -- The distance at which evidence will be rendered.
    reconstructRenderDistance = 100.0, -- The distance at which evidence will be rendered for the reconstructed scene.
    maxDisplayAmount = 3, -- The maximum amount of a group of evidence that can be displayed.
    queueInterval = 1, -- The interval at which shell casings will be added to the queue. Leave this at 1.
    evidenceGroupDistance = 2.0, -- The distance at which shell casings will be grouped together.
    maxFilesQuery = 20, -- The maximum amount of results to return from the database when searching for files.
    weaponGroups = {
        ["GROUP_HEAVY"] = {
            label = "Military-Grade Firearm",
            shellModel = `w_pi_singleshot_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_MG"] = {
            label = "Class-D Automatic Firearm",
            shellModel = `w_pi_singleshot_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_SNIPER"] = {
            label = "Class-D Sniper Rifle",
            shellModel = `w_pi_singleshot_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_SMG"] = {
            label = "Class-C Automatic Firearm",
            shellModel = `w_pi_singleshoth4_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_RIFLE"] = {
            label = "Class-C Semi-Automatic Rifle",
            shellModel = `w_pi_singleshot_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_SHOTGUN"] = {
            label = "Class-B Shotgun",
            shellModel = `w_sg_pumpshotgunh4_mag1`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
        ["GROUP_PISTOL"] = {
            label = "Class-B Semi-Automatic Pistol",
            shellModel = `w_pi_singleshoth4_shell`,
            shellRotation = vector3(0.0, 0.0, 0.0),
        },
    }
}

Config.Helmets = {
    EnableFlashlights = true, -- Set to false to disable flashlights 
    AllowedProps = {
        {
            up = 117,
            down = 116
        },
    }
}

Config.Bodycam = {
    item = {
        name = "police_bodycam", -- The name of the item to use for the camera.
        required = true, -- Only set this to true if the item is required to view the officer's bodycam.
    }
}

Config.Shields = {
    enabled = true,
    item = {
        name = "police_shield", -- The name of the item to use for the shield.
        required = true, -- Only set this to true if the item is required to use the shield.
        remove = true, -- Only set this to true if the item is removed when the shield is deployed.
    },
    Models = {
        [`prop_riot_shield`] = {
            Label = "Riot Shield",
            DefaultOffset = {vector3(0.0, 0.45, 0.05), vector3(180.0, -90.0, 0.0)},
            AimingOffset = {vector3(0.0, 0.35, 0.25), vector3(180.0, -90.0, 0.0)},
            Groups = {
                ["police"] = 0, 
            },
        },
        [`prop_ballistic_shield`] = {
            Label = "Police Shield",
            DefaultOffset = {vector3(-0.1, 0.45, 0.05), vector3(180.0, -90.0, 0.0)},
            AimingOffset = {vector3(-0.1, 0.35, 0.25), vector3(180.0, -90.0, 0.0)},
            Groups = {
                ["police"] = 0, 
            },
        },
    }
}

Config.Snakecam = {
    enabled = true,
    item = {
        name = "police_snakecam", -- The name of the item to use for the camera.
        required = true, -- Only set this to true if the item is required to use the camera.
    },
    MaxLength = 10.0,
    Controls = {
        up = 32,
        down = 33,

        look_up = 172,
        look_down = 173,
        look_left = 174,
        look_right = 175,

        stop_cam = 177
    }
}

Config.ObjectPlacement = {
    renderDistance = 100.0, -- The distance at which the object placement will be rendered. Leave this alone please.
    props = {
        {label = "Traffic Cone", model = `prop_roadcone02a`, image = "nui://pickle_policejob/nui/images/prop_roadcone02a.png"},
        {label = "Police Barrier", model = `prop_barrier_work05`, image = "nui://pickle_policejob/nui/images/prop_barrier_work05.png"},
        {label = "Construction Barrier #1", model = `prop_barrier_work06a`, image = "nui://pickle_policejob/nui/images/prop_barrier_work06a.png"},
        {label = "Construction Barrier #2", model = `prop_barrier_work06b`, image = "nui://pickle_policejob/nui/images/prop_barrier_work06b.png"},
        {label = "Police Tent", model = `prop_gazebo_02`, image = "nui://pickle_policejob/nui/images/prop_gazebo_02.png", targetZOffset = -1.0},
        {label = "Portable Light", model = `prop_worklight_03b`, image = "nui://pickle_policejob/nui/images/prop_worklight_03b.png"},
    }
}

-- Department / Computer

Config.Computer = {
    vehicleCommand = "pdterminal",
}

Config.PoliceArmory = {
    { 
        name = "weapon_2011",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 4,
    },
    {
        name = "weapon_stungun",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 1,
    },
    {
        name = "weapon_carbinerifle",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 1,
    },
    {
        name = "weapon_mutant_long",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 1,
    },
    {
        name = "weapon_2s",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 1,
    },
    {
        name = "weapon_pumpshotgun",
        count = 1,
        itemType = "weapon",
        price = 0,
        maxCount = 1,
    },
    {
        name = "rifle_ammo",
        count = 1000,
        itemType = "weapon",
        price = 0,
        maxCount = 1000,
    },
    {
        name = "pistol_ammo",
        count = 1000,
        itemType = "weapon",
        price = 0,
        maxCount = 1000,
    },
    {
        name = "shotgun_ammo",
        count = 1000,
        itemType = "weapon",
        price = 0,
        maxCount = 1000,
    },
    {
        name = "handcuffs",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "armor_vest",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "armor_plate2",
        count = 25,
        itemType = "item",
        price = 0,
        maxCount = 25,
    },
    {
        name = "breathalyzer",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "blood_test",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "gsr",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "fingerprint_scanner",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "evidence_camera",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "spray_remover",
        count = 20,
        itemType = "item",
        price = 0,
        maxCount = 20,
    },
    {
        name = "police_bodycam",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "police_shield",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "police_snakecam",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "grappler",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "stab_sticks",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "ankle_monitor",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
    {
        name = "police_stormram",
        count = 1,
        itemType = "item",
        price = 0,
        maxCount = 1,
    },
}

Config.PoliceGarageTypes = {
    cars = {
        label = "Vehicle Garage",
        cameraOffset = {
            coords = vector3(0.0, -6.0, 1.75), -- Where to set the camera.
            rotation = vector3(-20.0, 0.0, 0.0), -- Z does nothing, as that is the heading. X is up/down, Y is tilt left/right.
        }
    },
    boats = {
        label = "Boat Dock",
        cameraOffset = {
            coords = vector3(0.0, -6.0, 1.75), -- Where to set the camera.
            rotation = vector3(-20.0, 0.0, 0.0), -- Z does nothing, as that is the heading. X is up/down, Y is tilt left/right.
        }
    },
    aircraft = {
        label = "Aircraft Hangar",
        cameraOffset = {
            coords = vector3(0.0, -8.0, 2.75), -- Where to set the camera.
            rotation = vector3(-25.0, 0.0, 0.0), -- Z does nothing, as that is the heading. X is up/down, Y is tilt left/right.
        }
    },
}

Config.PoliceGarage = {
    -- CARS
    {
        garageType = "cars",
        label = "Crown Victory",
        image = "https://docs.fivem.net/vehicles/police.webp",
        model = `police`,
        price = 1000,
    },
    {
        garageType = "cars",
        label = "Police Interceptor",
        image = "https://docs.fivem.net/vehicles/police2.webp",
        model = `police2`,
    },
    {
        garageType = "cars",
        label = "Police SUV",
        image = "https://docs.fivem.net/vehicles/police3.webp",
        model = `police3`,
    },
    {
        garageType = "cars",
        label = "Police SUV II",
        image = "https://docs.fivem.net/vehicles/police4.webp",
        model = `police4`,
    },
    {
        garageType = "cars",
        label = "Police SUV III",
        image = "https://docs.fivem.net/vehicles/police5.webp",
        model = `police5`,
    },
    {
        garageType = "cars",
        label = "Police Bus",
        image = "https://docs.fivem.net/vehicles/pbus.webp",
        model = `pbus`,
    },
    {
        garageType = "cars",
        label = "S.W.A.T. Truck",
        image = "https://docs.fivem.net/vehicles/riot.webp",
        model = `riot`,
    },
    {
        garageType = "cars",
        label = "Riot Truck",
        image = "https://docs.fivem.net/vehicles/riot2.webp",
        model = `riot2`,
    },
    -- AIRCRAFT
    {
        garageType = "aircraft",
        label = "Police Helicopter",
        image = "https://docs.fivem.net/vehicles/polmav.webp",
        model = `polmav`,
    },
    -- BOATS
}

Config.Frontdesk = {
    requestOfficer = {
        timeout = 600, -- The timeout in seconds for requesting an officer.
        enabled = true,
        fields = {
            {type = "input", label = "Reason", placeholder = "Enter your reason", required = true},
        }
    },
    applyForDepartment = {
        enabled = true, -- Config.Evidence must also be enabled.
        fields = {
            {type = "input", label = "Discord Username", placeholder = "Enter your Discord username", required = true},
            {type = "input", label = "Phone Number", placeholder = "Enter your phone number", required = true},
            {type = "input", label = "Address", placeholder = "Enter your address", required = true},
            {type = "input", label = "Previous Experience", placeholder = "Enter your previous experience", required = true},
            {type = "input", label = "What is a 10-80?", placeholder = "Enter your answer", required = true},
            {type = "textarea", label = "Why do you want to join the department?", placeholder = "Enter your reason", required = true},
            {type = "textarea", label = "If an officer was corrupt, what should you do?", placeholder = "Enter your answer", required = true},
        }
    },
    fileReport = {
        enabled = true,
        fields = {
            {type = "input", label = "Discord Username", placeholder = "Enter your Discord username", required = true},
            {type = "input", label = "Phone Number", placeholder = "Enter your phone number", required = true},
            {type = "input", label = "Address", placeholder = "Enter your address", required = true},
            {type = "textarea", label = "Description", placeholder = "Enter your report description", required = true},
        }
    },
}

Config.Locker = {
    maxWeight = 100000,
    slots = 100,
}

Config.CurrencyItems = {
    -- These are the items that will be used for images from your inventory.
    ["money"] = "money",
    ["dirty_money"] = "black_money",
}

-- Integrations

Config.Integrations = {
    fines = {
        onFineIssued = function(id,source, target, title, description, amount)
            -- Called when a fine is issued.
        end,
        onFinePaid = function(id, source, issuingIdentifier, title, description, amount)
            -- Called when a fine is paid.
        end,
        onFineRemoved = function(id, source, issuingIdentifier, title, description, amount)
            -- Called when a fine is removed.
        end,
    },
    jail = {
        openJailMenu = function()
            -- Replace this with your export / event to open the jail menu. (Client-side ONLY)
            if GetResourceState("pickle_prisons") == "started" then
                ExecuteCommand("jailmenu")
                return true -- Return true to prevent the default jail menu from being opened.
            elseif GetResourceState("dynyx_prison") == "started" then
                ExecuteCommand("prison")
                return true -- Return true to prevent the default jail menu from being opened.
            elseif GetResourceState("DHS-PrisonSim") == "started" then
                exports['DHS-PrisonSim']:OpenConvoyMenu()
                return true
            end
            return false
        end,
        jailPlayer = function(source, targetId, time)
            -- Replace this with your export / event to jail a player. (Server-side ONLY)
            -- source is the officer who is jailing the player.
            -- targetId is the player who is being jailed.
            -- time is the time the player is being jailed for.
            if GetResourceState("pickle_prisons") == "started" then
                -- client side menu
            elseif GetResourceState("qb-prison") == "started" then
                TriggerClientEvent("police:client:SendToJail", targetId, time)
            elseif GetResourceState("rcore_prison") == "started" then
                exports['rcore_prison']:Jail(targetId, time, reason)
            elseif GetResourceState("tk_jail") == "started" then
                exports.tk_jail:jail(targetId, time)
            end
            ResetPlayerDetainment(targetId)
        end,
    },
    duty = {
        client = function(departmentId, isOnDuty, report)
        end,
        server = function(source, departmentId, isOnDuty, report)
        end,
    },
    inventory = {
        OpenNearbyInventory = function()
            -- Replace this with your export / event to open the nearby inventory. (Client-side ONLY)
        end,
    },
    bloodTest = {
        client = function(source)
            -- Replace this with your export / event to get the blood test results. (Client-side ONLY)
        end,
        server = function(source)
            -- Replace this with your export / event to get the blood test results. (Server-side ONLY)
        end,
    },
    evidence = {
        fileCreated = function(source, id, data)
            -- Called when a file is created.
            if GetResourceState("lb-tablet") == "started" then
                local gallery = {}
                for i=1, #data.evidence do
                    if data.evidence[i].image then
                        table.insert(gallery, data.evidence[i].image)
                    end
                end
                local case = {
                    title = data.name,
                    description = ConvertHTMLToPlaintext(data.document.content),
                    type = "Evidence Casefile",
                    evidence = gallery,
                    officers = {GetIdentifier(source)},
                }
                local caseId, errorMessage = exports["lb-tablet"]:CreatePoliceCase(source, case)
            elseif GetResourceState("tk_mdt") == "started" then
                exports.tk_mdt:createIncident({
                    playerId = source,
                    page = ConvertHTMLToPlaintext(data.document.content),
                })
            elseif GetResourceState("redutzu-mdt") == "started" then
                exports['redutzu-mdt']:CreateIncident({
                    name = data.name,
                    description = ConvertHTMLToPlaintext(data.document.content),
                    players = { },
                    victims = { },
                    cops = { GetIdentifier(source) },
                    vehicles = { },
                    evidences = { },
                    charges = {
                        list = { },
                        amount = { fine = 0, jail = 0 },
                        reduction = { fine = 0, jail = 0 }
                    }
                }, source)
            end
        end,
        fileUpdated = function(source, id, data)
            -- Called when a file is updated.
        end,
        fileDeleted = function(source, id)
            -- Called when a file is deleted.
        end,
    },
    police_actions = {
        client_target = function()
            if Config.UseTarget then
                local onSelect = function(interactType, source)
                    if not IsPlayerOnDuty() then return ShowNotification(_L("not_on_duty")) end
                    if interactType == "handcuffs" then
                        EquipHandcuffs()
                    elseif interactType == "drag" then
                        local targetPlayer = GetClosestPlayer()
                        if not targetPlayer then return ShowNotification(_L("no_player_nearby")) end
                        TriggerServerEvent("pickle_policejob:actions:detainment", GetPlayerServerId(targetPlayer), {
                            eventType = "toggleDrag",
                        })
                    elseif interactType == "vehicleseat" then
                        local targetPlayer = GetClosestPlayer()
                        if not targetPlayer then return ShowNotification(_L("no_player_nearby")) end
                        local targetVehicle = GetNearestVehicle()
                        if not targetVehicle then return ShowNotification(_L("no_vehicle_nearby")) end
                        local seatId = nil
                        if not IsPedInVehicle(GetPlayerPed(targetPlayer), targetVehicle, false) then
                            local maxPassengers = GetVehicleMaxNumberOfPassengers(targetVehicle)
                            local openSeats = {}
                            for i=1, maxPassengers - 1 do
                                local result = GetPedInVehicleSeat(targetVehicle, i)
                                if not result or result == 0 then
                                    table.insert(openSeats, i)
                                end
                            end
                            if #openSeats == 0 then
                                ShowNotification(_L("vehicle_full"))
                                return
                            end
                            seatId = openSeats[1]
                        end
                        TriggerServerEvent("pickle_policejob:actions:detainment", GetPlayerServerId(targetPlayer), {
                            eventType = "toggleVehicleSeat",
                            netId = VehToNet(targetVehicle),
                            seatId = seatId,
                        })
                    elseif interactType == "search" then
                        OpenNearbyInventory()
                    end
                end
                local canInteract = function(interactType, source)
                    return IsPlayerOnDuty()
                end
                local actions = {"handcuffs", "drag", "vehicleseat", "search"}
                local options = {}
                for i=1, #actions do
                    table.insert(options, {
                        name = actions[i],
                        label = _L("actions_" .. actions[i]),
                        icon = Config.TargetIcons[actions[i]],
                        interactCheck = function(...) return canInteract(actions[i], ...) end,
                        onSelected = function(...) onSelect(actions[i], ...) end
                    })
                end
                AddTargetGlobalPlayer(options)
            end
        end,
        client = function()
            -- Modify this if you want, your call.
            -- You can also call TriggerEvent("pickle_policejob:actions:equipAction", "action") to equip an action.
            -- Actions: handcuffs, stab_sticks, breathalyzer, fingerprint_scanner, grappler, shields, snakecam, evidence_camera, gsr, blood_test
            if IsMenuOpen then return end
            IsMenuOpen = true
            local menuId = "pickle_policejob:actions:menu"
            local options = {
                {
                    title = _L("actions_id_card"),
                    description = _L("actions_id_card_description"),
                    icon = Config.TargetIcons.id_card,
                    onSelect = function()
                        IsMenuOpen = false
                        OpenIDCardMenu()
                    end,
                },
                {
                    title = _L("actions_vehicle_interact"),
                    description = _L("actions_vehicle_interact_description"),
                    icon = Config.TargetIcons.vehicle_interact,
                    onSelect = function()
                        IsMenuOpen = false
                        OpenVehicleInteractMenu()
                    end,
                },
                {
                    title = _L("actions_handcuffs"),
                    description = _L("actions_handcuffs_description"),
                    icon = Config.TargetIcons.handcuffs,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipHandcuffs()
                    end,
                },
                {
                    title = _L("actions_drag"),
                    description = _L("actions_drag_description"),
                    icon = Config.TargetIcons.escort,
                    onSelect = function()
                        IsMenuOpen = false
                        local targetPlayer = GetClosestPlayer()
                        if not targetPlayer then return end
                        TriggerServerEvent("pickle_policejob:actions:detainment", GetPlayerServerId(targetPlayer), {
                            eventType = "toggleDrag",
                        })
                    end,
                },
                {
                    title = _L("actions_vehicleseat"),
                    description = _L("actions_vehicleseat_description"),
                    icon = "car",
                    onSelect = function()
                        IsMenuOpen = false
                        local targetPlayer = GetClosestPlayer()
                        if not targetPlayer then return ShowNotification(_L("no_player_nearby")) end
                        local targetVehicle = GetNearestVehicle()
                        if not targetVehicle then return ShowNotification(_L("no_vehicle_nearby")) end
                        local seatId = nil
                        if not IsPedInVehicle(GetPlayerPed(targetPlayer), targetVehicle, false) then
                            local maxPassengers = GetVehicleMaxNumberOfPassengers(targetVehicle)
                            local openSeats = {}
                            for i=1, maxPassengers - 1 do
                                local result = GetPedInVehicleSeat(targetVehicle, i)
                                if not result or result == 0 then
                                    table.insert(openSeats, i)
                                end
                            end
                            if #openSeats == 0 then
                                ShowNotification(_L("vehicle_full"))
                                return
                            end
                            seatId = openSeats[1]
                        end
                        TriggerServerEvent("pickle_policejob:actions:detainment", GetPlayerServerId(targetPlayer), {
                            eventType = "toggleVehicleSeat",
                            netId = VehToNet(targetVehicle),
                            seatId = seatId,
                        })
                    end,
                },
                {
                    title = _L("actions_search"),
                    description = _L("actions_search_description"),
                    icon = Config.TargetIcons.search,
                    onSelect = function()
                        IsMenuOpen = false
                        OpenNearbyInventory()
                    end,
                },
                {
                    title = _L("actions_objects"),
                    description = _L("actions_objects_description"),
                    icon = Config.TargetIcons.objects,
                    arrow = true,
                    onSelect = function()
                        SetTimeout(100, function()
                            OpenObjectPlacementMenu()
                        end)
                    end,
                }
            }
            if Config.Shields.enabled then
                table.insert(options, {
                    title = _L("actions_shields"),
                    description = _L("actions_shields_description"),
                    icon = Config.TargetIcons.shields,
                    onSelect = function()
                        IsMenuOpen = false
                        UnequipCurrentActions()
                        OpenShields()
                    end,
                })
            end
            if Config.Snakecam.enabled then
                table.insert(options, {
                    title = _L("actions_snakecam"),
                    description = _L("actions_snakecam_description"),
                    icon = Config.TargetIcons.snakecam,
                    onSelect = function()
                        IsMenuOpen = false
                        UnequipCurrentActions()
                        StartSnakeCam()
                    end,
                })
            end
            if Config.Grappler.enabled then
                table.insert(options, {
                    title = _L("actions_grappler"),
                    description = _L("actions_grappler_description"),
                    icon = Config.TargetIcons.grappler,
                    onSelect = function()
                        IsMenuOpen = false
                        StartGrapplerPlacement()
                    end,
                })
            end
            if Config.StabSticks.enabled then
                table.insert(options, {
                    title = _L("actions_stab_sticks"),
                    description = _L("actions_stab_sticks_description"),
                    icon = Config.TargetIcons.stab_sticks,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipStabSticks()
                    end,
                })
            end
            if Config.Evidence.enabled then
                table.insert(options, {
                    title = _L("actions_evidence_camera"),
                    description = _L("actions_evidence_camera_description"),
                    icon = Config.TargetIcons.evidence_camera,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipEvidenceCamera()
                    end,
                })
                table.insert(options, {
                    title = _L("actions_breathalyzer"),
                    description = _L("actions_breathalyzer_description"),
                    icon = Config.TargetIcons.breathalyzer,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipBreathalyzer()
                    end,
                })
                table.insert(options, {
                    title = _L("actions_fingerprint_scanner"),
                    description = _L("actions_fingerprint_scanner_description"),
                    icon = Config.TargetIcons.fingerprint_scanner,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipFingerprintScanner()
                    end,
                })
                table.insert(options, {
                    title = _L("actions_gsr_scanner"),
                    description = _L("actions_gsr_scanner_description"),
                    icon = Config.TargetIcons.gsr_scanner,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipGSRScanner()
                    end,
                })
                table.insert(options, {
                    title = _L("actions_blood_test"),
                    description = _L("actions_blood_test_description"),
                    icon = Config.TargetIcons.blood_test,
                    onSelect = function()
                        IsMenuOpen = false
                        EquipBloodTest()
                    end,
                })
            end
            if Config.Fines.enabled then
                table.insert(options, {
                    title = _L("actions_fines"),
                    description = _L("actions_fines_description"),
                    icon = Config.TargetIcons.fines,
                    onSelect = function()
                        IsMenuOpen = false
                        local targetPlayer = GetClosestPlayer()
                        if not targetPlayer then return ShowNotification(_L("no_player_nearby")) end
                        ViewFines(GetPlayerServerId(targetPlayer))
                    end,
                })
            end
            if Config.Jail.enabled then
                table.insert(options, {
                    title = _L("actions_jail"),
                    description = _L("actions_jail_description"),
                    icon = Config.TargetIcons.jail,
                    onSelect = function()
                        IsMenuOpen = false
                        if Config.Integrations.jail.openJailMenu() then return end
                        OpenPoliceJailMenu()
                    end,
                })
            end
            lib.registerContext({
                id = menuId,
                title = _L("police_actions_menu"),
                options = options,
                onExit = function()
                    IsMenuOpen = false
                end
            })
            lib.showContext(menuId)
        end
    },
    requestOfficer = {
        client = function(id, results)
            -- Replace this with your export / event to request an officer. (Client-side ONLY)
            if GetResourceState("ps-dispatch") == "started" then
                local coords = GetEntityCoords(PlayerPedId())
                exports["ps-dispatch"]:CustomAlert({
                    coords = coords,
                    message = "An officer has been requested at the station.",
                    dispatchCode = "10-27",
                    description = "Officer Request",
                    radius = 0,
                    sprite = 64,
                    color = 2,
                    scale = 1.0,
                    length = 3,
                })
            end
        end,
        server = function(source, id, results)
            -- Replace this with your export / event to request an officer. (Server-side ONLY)
            local department = GetDepartment(id)
            if not department then return end
            if GetResourceState("lb-tablet") == "started" then
                local dispatchId = exports["lb-tablet"]:AddDispatch({
                    priority = "low",
                    code = "10-27",
                    title = "Officer Request",
                    description = "An officer has been requested at the station.",
                    location = {
                        label = "Officer Request",
                        coords = { x = department.location.coords.x, y = department.location.coords.y },
                    },
                    time = 30,
                    job = department.job
                })
            elseif GetResourceState("cd_dispatch") == "started" then
                TriggerClientEvent('cd_dispatch:AddNotification', -1, {
                    job_table = {department.job},
                    coords = vector3(department.location.coords.x, department.location.coords.y, department.location.coords.z),
                    title = '10-27 - Officer Request',
                    message = 'An officer has been requested at the station.',
                    flash = 0,
                    unique_id = tostring(math.random(0000000,9999999)),
                    sound = 1,
                    blip = {
                        sprite = 431,
                        scale = 1.2,
                        colour = 3,
                        flashes = false,
                        text = '411 - Officer Request',
                        time = 5,
                        radius = 0,
                    }
                })
            elseif GetResourceState("qs-dispatch") == "started" then
                TriggerEvent('qs-dispatch:server:CreateDispatchCall', {
                    job = { department.job }, -- List of jobs to receive the dispatch
                    callLocation = vector3(department.location.coords.x, department.location.coords.y, department.location.coords.z), -- Coordinates of the call
                    callCode = { code = '10-27', snippet = 'Officer Request' }, -- Call code and description
                    message = "An officer has been requested at the station.", -- Dispatch call message
                    flashes = false, -- Should the blip on the map flash?
                    blip = { -- Blip details for the map
                        sprite = 488, -- Blip icon type
                        scale = 1.5, -- Blip size
                        colour = 1, -- Blip color
                        flashes = true, -- Blip flashes
                        text = '411 - Officer Request', -- Blip label
                        time = (60 * 1000), -- Duration of the blip (milliseconds)
                    }
                })
            elseif GetResourceState("tk_dispatch") == "started" then
                exports.tk_dispatch:addCall({
                    title = "Officer Request",
                    code = "10-27",
                    message = "An officer has been requested at the station.",
                    coords = vector3(department.location.coords.x, department.location.coords.y, department.location.coords.z),
                    location = "Officer Request",
                    jobs = { department.job },
                    sprite = 488,
                    scale = 1.5,
                    color = 1,
                    flash = false,
                })
            elseif GetResourceState("tk_mdt") == "started" then
                exports.tk_mdt:addCall({
                    title = "Officer Request",
                    code = "10-27",
                    message = "An officer has been requested at the station.",
                    coords = vector3(department.location.coords.x, department.location.coords.y, department.location.coords.z),
                    location = "Officer Request",
                    jobs = { department.job },
                    sprite = 488,
                    scale = 1.5,
                    color = 1,
                    flash = false,
                })
            end
        end,
    },
}