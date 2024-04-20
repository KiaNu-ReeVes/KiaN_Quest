local ESX = nil
local PlayerData = {}
local Thread = false
local QuestName = nil
local OnQuest = false 
local Nitem = 0 
local item = nil 
local Medrandom = math.random(10,20) 
local minirandom = math.random(1,3) 
local highrandom = math.random(50,80) 
local tenrandmon = math.random(5,10) 
local Max = 0
local shans = math.random(1,2)
local shans2 = math.random(1,3)
local Roads = {
    vector3(-230.5582, -972.4484, 29.12817),
    vector3(226.655, 201.6659, 105.3231),
    vector3(-850.3781, -1191.705, 5.622681),
    vector3(921.2703, -182.9275, 74.06665),
    vector3(-1083.547, -268.2066, 37.58679),
    vector3(-665.7758, -228.1451, 37.26672),
    vector3(-367.0154, -159.9824, 38.21021),
    vector3(817.0945, -1955.064, 29.16187),
    vector3(-620.2681, -923.9868, 23.04541),
    vector3(-613.3714, 3.745055, 42.10254),


}
local ShRoads =  {
    vector3(-138.5011, 6458.268, 31.45349),
    vector3(1703.499, 6419.183, 32.63293),
    vector3(2772.409, 3407.486, 55.88574),
    vector3(1457.169, 758.189, 77.38611),
    vector3(1201.556, 2677.305, 37.72156),
    vector3(-2973.508, 481.6879, 15.2439),
    vector3(-1805.881, 801.9561, 138.5004),
    vector3(2327.037, 5066.716, 45.72522),
    vector3(1907.116, 2609.71, 45.74219),
    vector3(2577.349, 364.589, 108.4572),

}
local Dir1 = 0 
local Dir2 = 0
local Dir3 = 0

local drug = {
    'marijuana',
    'cocaine',
    'crack',
    'meth',
    'heroine',
}

local robs = {
    'Shop',
    'Selector',
    'Javaheri',
}
local RevivePlayerJob = {
    'police',
    'mechanic',
    'sheriff',
    -- 'taxi',
}

local PoliceScurity = 
{
    vector3(194.189, -946.5626, 30.08862),
    vector3(-371.1824, -130.6286, 38.68201),
    vector3(-838.7736, -1211.38, 6.751709),
    vector3(918.633, -178.6549, 74.25208),
    vector3(-625.0549, -937.0549, 22.05127)
}
local SheirffScurity = {
    vector3(1453.2, 761.2088, 77.23438),
    vector3(1421.802, 6505.147, 19.67542),
}

local Guns = {
    ["WEAPON_PISTOL"]        = true,
    ["WEAPON_PISTOL_MK2"]    = true,
    ["WEAPON_COMBATPISTOL"]  = true,
    ["WEAPON_HEAVYPISTOL"]   = true,
    ["WEAPON_STUNGUN"]       = true,
    ["WEAPON_PISTOL50"]      = true,
    ["WEAPON_SNSPISTOL"]     = true,
    ["WEAPON_SNSPISTOL_MK2"] = true,
    ["WEAPON_VINTAGEPISTOL"] = true,
    ["WEAPON_FLAREGUN"]      = true,
    ["WEAPON_MARKSMANPISTOL"]= true,
    ["WEAPON_REVOLVER"]      = true,
    ["WEAPON_REVOLVER_MK2"]  = true,
    ["WEAPON_APPISTOL"]      = true,
    ["WEAPON_RAYPISTOL"]     = true,
    ["WEAPON_CERAMICPISTOL"] = true,
    ["WEAPON_NAVYREVOLVER"]  = true,
    ["WEAPON_GADGETPISTOL"]  = true,
    ["WEAPON_DOUBLEACTION"]  = true,
    ["WEAPON_UNARMED"]       = true,
}
local Levels = {
    [0]  = 0,
    [1]  = 30,
    [2]  = 15,
    [3]  = 45,
    [4]  = 30,
    [5]  = 30,
    [6]  = 100,
    [7]  = 150,
    [8]  = 190,
    [9]  = 200,
    [10] = 225,
    [11] = 400
}
local LevelsP = {
    [0]  = 0,
    [1]  = 3.333333333333333,
    [2]  = 6.666666666666667,
    [3]  = 2.222222222222222,
    [4]  = 3.333333333333333,
    [5]  = 3.333333333333333,
    [6]  = 1,
    [7]  = 0.6666666666666667,
    [8]  = 0.5263157894736842,
    [9]  = 0.5,
    [10] = 0.4444444444444444,
    [11] = 0.25
}
local Rewards = {
    ["BusDriver"] = {
        Name  = "BusDriver",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Resandan Mosaferan Be Maghsad",
    },
    ["MiveChin"]         = {
        Name  = "MiveChin",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Forosh Mive",
    },
    ["BaghBan"]   = {
        Name  = "BaghBan",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Tamiz Kardan Khane",
    },
    ["PostChi"]  = {
        Name  = "PostChi",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Tahvil Chand Kala",
    },
    ["GhoreKeshi"]         = {
        Name  = "GhoreKeshi",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Sherkat Dar Ghore Keshi",
    },
    ["KharidBTC"]         = {
        Name  = "KharidArz",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Kharid Yek Arz",
    },
    ["RobDrug"]  = {
        Name  = "RobDrug",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Dozdi Drug",
    },
    ["StartRob"]  = {
        Name  = "StartRob",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Start Kardan Robbery ",
    },
    ["UseDrug"]  = {
        Name  = "UseDrug",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Estefade Yek Mavad",
    },
    ["SellDrug"]  = {
        Name  = "SellDrug",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Forosh Yek Mavad",
    },
    ["Patrol"]  = {
        Name  = "Patrol",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Gasht Zani Dar Jade ha",
    },
    ["security"]  = {
        Name  = "security",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Mohafezat Kardan Az yek Mantghe",
    },
    ["heal"]  = {
        Name  = "heal",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Heal Kardan Player Ha",
    },
    ["Revive"]  = {
        Name  = "Revive",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "Revive Kardan Player Ha",
    },
    ["repair"]  = {
        Name  = "repair",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "repair Kardan Mashin",
    },
    ["clean"]  = {
        Name  = "clean",
        Money = 15000,
        -- xCoin  = 5,
        XP    = 5,
        Tozih = "clean Kardan Mashin",
    },
    -- ["acceptedrequest"]  = {
    --     Name  = "acceptedrequest",
    --     Money = 15000,
    --     -- xCoin  = 5,
    --     XP    = 5,
    --     Tozih = "Accept Request hay Taxi",
    -- },
}
local AllBotPos = {
    vector3(-231.13543701172, -915.9697265625, 31.310794830322),
    vector3(436.27627563477, -976.59765625, 29.721849441528),
    vector3(-133.03616333008, -118.3078994751, 55.550998687744),
    vector3(714.70397949219, 612.03814697266, 128.17437133789),
    vector3(556.15759277344, 2674.0715332031, 41.170230865479),
    vector3(304.39474487305, -595.59930419922, 42.28405380249),
    vector3(-353.45983886719, -132.17903137207, 38.009613037109),
    vector3(904.26171875, -193.6997833252, 72.814079284668),
    vector3(102.91593933105, 6613.7578125, 31.435321807861),
}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getkianobject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    while ESX.GetPlayerData().job == nil do 
        Citizen.Wait(100)
    end
    PlayerData = ESX.GetPlayerData()
    
    for k,v in pairs(AllBotPos) do 
    local Shopper = AddBlipForCoord(v)
	SetBlipSprite(Shopper, 465)
	SetBlipColour(Shopper,  33)
	SetBlipAlpha(Shopper, 250)
	SetBlipScale(Shopper, 0.8)
    SetBlipAsShortRange(Shopper, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Quest')
	EndTextCommandSetBlipName(Shopper)
	ped_hash = GetHashKey("csb_reporter")
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end
	BossNPC = CreatePed(1, ped_hash,v,-0.90, 267.96, false, true)
	SetBlockingOfNonTemporaryEvents(BossNPC, true)
	SetPedDiesWhenInjured(BossNPC, false)
	SetPedCanPlayAmbientAnims(BossNPC, true)
	SetPedCanRagdollFromPlayerImpact(BossNPC, false)
	SetEntityInvincible(BossNPC, true)
	FreezeEntityPosition(BossNPC, true)
end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k,v in pairs(AllBotPos) do 
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)) ,vector3(v.x,v.y,v.z+2.4), true) < 30 then
		        DrawMarker(32, vector3(v.x,v.y,v.z+2.4),0.50, 0.50, 0.50, 0.0, 360, 0.0, 0.50, 0.50, 0.50, 255, 0, 0, 100, true, true, 2, nil, nil, false)
            end
        end
    end
end)

AddEventHandler("onKeyDown", function(key)
    for k,v in pairs(AllBotPos) do 
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)) ,vector3(v.x,v.y,v.z+2.4), true) < 2 then
            if key == "e" then
                menuopenorclose(true)
            end
        end
    end
    if key == "o" then
        levelandxpopenorclose()
    end
end)


RegisterNUICallback('NUIFocusOff', function()
	menuopenorclose(false)
end)
RegisterNUICallback('idontknow', function(data)
    if data.shoquest == 'playerquest' then
        PlayerQuests()
    elseif data.shoquest == 'gangquest' then
        if PlayerData.gang.name ~= 'nogang' then
            GangQuests()
        else
            ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Ozv Hich Gangi Nistid <span style='color:#ff0000'></span>")
        end
    elseif data.shoquest == 'jobquest' then
        if PlayerData.job.name == 'police' or PlayerData.job.name == 'fbi' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' then
            JobQuests()
        else
            ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Ozv Hich Jobi Nistid <span style='color:#ff0000'></span>")
        end
    elseif data.shoquest == 'accept' then
        ESX.TriggerServerCallback("KiaN_Quest:GetOnWork", function(OnWork)
            local action = data.valuea
            if action == nil then ESX.ShowNotification('Lotfan Yek Gozine Ra Entekhab Konid !') return end
            if OnWork ~= nil then
                if action == 'RobDrug' or action == 'UseDrug' or action == 'StartRob' or action == 'SellDrug' then 
                    if data.cant == true then ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma In Quest Ra Az Ghabl Ghabool Kardid Ya Anjam Dadid <span style='color:#ff0000'></span>") return end
                    Process(function(data)
                        StartQuest(data)
                        TriggerServerEvent("KiaN_Quest:AcceptedQuest", data,'Gnag')
                        ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Quest Mored Nazar Ra Accept Kardid <span style='color:#ff0000'></span>")
                        ESX.ShowNotification("~g~Shoma In Quest Ra Accept Kardid")
                    end, action, OnWork,'gang')
                elseif action == 'PostChi' or action == 'BaghBan' or action == 'MiveChin' or action == 'BusDriver' or action == 'GhoreKeshi' or action == 'KharidBTC' then 
                    if data.cant == true then ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma In Quest Ra Az Ghabl Ghabool Kardid Ya Anjam Dadid <span style='color:#ff0000'></span>") return end
                    Process(function(data)
                        StartQuest(data)
                        TriggerServerEvent("KiaN_Quest:AcceptedQuest", data,'player')
                        ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Quest Mored Nazar Ra Accept Kardid <span style='color:#ff0000'></span>")
                        ESX.ShowNotification("~g~Shoma In Quest Ra Accept Kardid")

                    end, action, OnWork)
                elseif action == 'Patrol' or action == 'security' or action == 'Revive' or action == 'heal' or action == 'repair' or action == 'clean' then 
                    if data.cant == true then ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma In Quest Ra Az Ghabl Ghabool Kardid Ya Anjam Dadid <span style='color:#ff0000'></span>") return end
                    Process(function(data)
                        StartQuest(data)
                        TriggerServerEvent("KiaN_Quest:AcceptedQuest", data,'job')
                        ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Quest Mored Nazar Ra Accept Kardid <span style='color:#ff0000'></span>")
                        ESX.ShowNotification("~g~Shoma In Quest Ra Accept Kardid")
                    end, action, OnWork,'job')
                end
            end
        end)
    end
end)

function menuopenorclose(what)
	if what then
        SetNuiFocus(true, true)
        SendNUIMessage({action = "showmenu", show = what})
	else
		SetNuiFocus(false, false)
        SendNUIMessage({action = "showmenu", show = what})
	end
end
local menubazshodespamnakon = true
function levelandxpopenorclose()
    if menubazshodespamnakon then
        menubazshodespamnakon = false
        ESX.TriggerServerCallback("KiaN_Quest:GetLevelAndXP", function(PlayerData)
            if PlayerData ~= nil then
                PlayerData.Level = PlayerData.Level
                PlayerData.XP    = PlayerData.XP
                SendNUIMessage({action = "sendlevelandxp", level = PlayerData.Level, xp = PlayerData.XP, endxp = Levels[PlayerData.Level + 1], endxpp = LevelsP [PlayerData.Level + 1]})
            end
        end)
        SendNUIMessage({action = "showlevelandxp", show = true})
        Wait(10000)
        SendNUIMessage({action = "showlevelandxp", show = false})
        menubazshodespamnakon = true
    else
        ESX.ShowNotification('Spam Nakon')
    end
end

function PlayerQuests()
    ESX.TriggerServerCallback("KiaN_Quest:GetPlayerQuestStatus", function(Info)
        if shans2 == 1 then 
            if Info["PostChi"] then
                SendNUIMessage({action = "playerquest", label = "Quest [1] [✔️]", value = "PostChi", cantquest = false ,Money = Rewards["PostChi"].Money, Tozih = Rewards["PostChi"].Tozih, xp = Rewards["PostChi"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [1] [❌]", value = "PostChi", cantquest = true ,Money = Rewards["PostChi"].Money, Tozih = Rewards["PostChi"].Tozih, xp = Rewards["PostChi"].XP})
            end
            if Info["BaghBan"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [2] [✔️]", value = "BaghBan", cantquest = false ,Money = Rewards["BaghBan"].Money, Tozih = Rewards["BaghBan"].Tozih, xp = Rewards["BaghBan"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [2] [❌]", value = "BaghBan", cantquest = true ,Money = Rewards["BaghBan"].Money, Tozih = Rewards["BaghBan"].Tozih, xp = Rewards["BaghBan"].XP})
            end
        elseif shans2 == 2 then
            if Info["MiveChin"] then
                SendNUIMessage({action = "playerquest", label = "Quest [3] [✔️]", value = "MiveChin", cantquest = false ,Money = Rewards["MiveChin"].Money, Tozih = Rewards["MiveChin"].Tozih, xp = Rewards["MiveChin"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [3] [❌]", value = "MiveChin", cantquest = true ,Money = Rewards["MiveChin"].Money, Tozih = Rewards["MiveChin"].Tozih, xp = Rewards["MiveChin"].XP})
            end
            if Info["BusDriver"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [4] [✔️]", value = "BusDriver", cantquest = false ,Money = Rewards["BusDriver"].Money, Tozih = Rewards["BusDriver"].Tozih, xp = Rewards["BusDriver"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [4] [❌]", value = "BusDriver", cantquest = true ,Money = Rewards["BusDriver"].Money, Tozih = Rewards["BusDriver"].Tozih, xp = Rewards["BusDriver"].XP})
            end
        else
            if Info["GhoreKeshi"] then
                SendNUIMessage({action = "playerquest", label = "Quest [5] [✔️]", value = "GhoreKeshi", cantquest = false ,Money = Rewards["GhoreKeshi"].Money, Tozih = Rewards["GhoreKeshi"].Tozih, xp = Rewards["GhoreKeshi"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [5] [❌]", value = "GhoreKeshi", cantquest = true ,Money = Rewards["GhoreKeshi"].Money, Tozih = Rewards["GhoreKeshi"].Tozih, xp = Rewards["GhoreKeshi"].XP})
            end
            if Info["KharidBTC"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [6] [✔️]", value = "KharidBTC", cantquest = false ,Money = Rewards["KharidBTC"].Money, Tozih = Rewards["KharidBTC"].Tozih, xp = Rewards["KharidBTC"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [6] [❌]", value = "KharidBTC", cantquest = true ,Money = Rewards["KharidBTC"].Money, Tozih = Rewards["KharidBTC"].Tozih, xp = Rewards["KharidBTC"].XP})
            end
        end
    end)
end
function GangQuests()
    ESX.TriggerServerCallback("KiaN_Quest:GetGangQuestStatus", function(Info)
        if shans == 1 then 
            if Info["RobDrug"] then
                SendNUIMessage({action = "playerquest", label = "Quest [1] [✔️]", value = "RobDrug", cantquest = false ,Money = Rewards["RobDrug"].Money, Tozih = Rewards["RobDrug"].Tozih, xp = Rewards["RobDrug"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [1] [❌]", value = "RobDrug", cantquest = true ,Money = Rewards["RobDrug"].Money, Tozih = Rewards["RobDrug"].Tozih, xp = Rewards["RobDrug"].XP})
            end
            if Info["UseDrug"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [2] [✔️]", value = "UseDrug", cantquest = false ,Money = Rewards["UseDrug"].Money, Tozih = Rewards["UseDrug"].Tozih, xp = Rewards["UseDrug"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [2] [❌]", value = "UseDrug", cantquest = true ,Money = Rewards["UseDrug"].Money, Tozih = Rewards["UseDrug"].Tozih, xp = Rewards["UseDrug"].XP})
            end
            else 
            if Info["StartRob"] then
                SendNUIMessage({action = "playerquest", label = "Quest [3] [✔️]", value = "StartRob", cantquest = false ,Money = Rewards["StartRob"].Money, Tozih = Rewards["StartRob"].Tozih, xp = Rewards["StartRob"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [3] [❌]", value = "StartRob", cantquest = true ,Money = Rewards["StartRob"].Money, Tozih = Rewards["StartRob"].Tozih, xp = Rewards["StartRob"].XP})
            end
            if Info["SellDrug"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [4] [✔️]", value = "SellDrug", cantquest = false ,Money = Rewards["SellDrug"].Money, Tozih = Rewards["SellDrug"].Tozih, xp = Rewards["SellDrug"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [4] [❌]", value = "SellDrug", cantquest = true ,Money = Rewards["SellDrug"].Money, Tozih = Rewards["SellDrug"].Tozih, xp = Rewards["SellDrug"].XP})
            end
        end
    end)
    SendNUIMessage({action = "opengang"})
end
function JobQuests()
    ESX.TriggerServerCallback("KiaN_Quest:GetJobQuestStatus", function(Info)
        if PlayerData.job.name == 'police' or PlayerData.job.name == 'fbi' or PlayerData.job.name == 'sheriff' then 
            if Info["Patrol"] then
                SendNUIMessage({action = "playerquest", label = "Quest [MILITRY] [✔️]", value = "Patrol", cantquest = false ,Money = Rewards["Patrol"].Money, Tozih = Rewards["Patrol"].Tozih, xp = Rewards["Patrol"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [MILITRY] [❌]", value = "Patrol", cantquest = true ,Money = Rewards["Patrol"].Money, Tozih = Rewards["Patrol"].Tozih, xp = Rewards["Patrol"].XP})
            end
            if Info["security"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [MILITRY] [✔️]", value = "security", cantquest = false ,Money = Rewards["security"].Money, Tozih = Rewards["security"].Tozih, xp = Rewards["security"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [MILITRY] [❌]", value = "security", cantquest = true ,Money = Rewards["security"].Money, Tozih = Rewards["security"].Tozih, xp = Rewards["security"].XP})
            end
        elseif PlayerData.job.name == 'ambulance' then 
            if Info["Revive"] then
                SendNUIMessage({action = "playerquest", label = "Quest [MEDIC] [✔️]", value = "Revive", cantquest = false ,Money = Rewards["Revive"].Money, Tozih = Rewards["Revive"].Tozih, xp = Rewards["Revive"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [MEDIC] [❌]", value = "Revive", cantquest = true ,Money = Rewards["Revive"].Money, Tozih = Rewards["Revive"].Tozih, xp = Rewards["Revive"].XP})
            end
            if Info["heal"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [MEDIC] [✔️]", value = "heal", cantquest = true ,Money = Rewards["heal"].Money, Tozih = Rewards["heal"].Tozih, xp = Rewards["heal"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [MEDIC] [❌]", value = "heal", cantquest = true ,Money = Rewards["heal"].Money, Tozih = Rewards["heal"].Tozih, xp = Rewards["heal"].XP})
            end
        elseif PlayerData.job.name == 'mechanic' then 
            if Info["repair"] then
                SendNUIMessage({action = "playerquest", label = "Quest [MECHANIC] [✔️]", value = "repair", cantquest = false ,Money = Rewards["repair"].Money, Tozih = Rewards["repair"].Tozih, xp = Rewards["repair"].XP})
            else
                SendNUIMessage({action = "playerquest", label = "Quest [MECHANIC] [❌]", value = "repair", cantquest = true ,Money = Rewards["repair"].Money, Tozih = Rewards["repair"].Tozih, xp = Rewards["repair"].XP})
            end
            if Info["clean"] then
                SendNUIMessage({action = "playerquest2", label = "Quest [MECHANIC] [✔️]", value = "clean", cantquest = false ,Money = Rewards["clean"].Money, Tozih = Rewards["clean"].Tozih, xp = Rewards["clean"].XP})
            else
                SendNUIMessage({action = "playerquest2", label = "Quest [MECHANIC] [❌]", value = "clean", cantquest = true ,Money = Rewards["clean"].Money, Tozih = Rewards["clean"].Tozih, xp = Rewards["clean"].XP})
            end
        -- elseif PlayerData.job.name == 'taxi' then
        --     if Info["acceptedrequest"] then
        --         SendNUIMessage({action = "playerquest", label = "Quest [TAXI] [✔️]", value = "acceptedrequest", cantquest = false ,Money = Rewards["acceptedrequest"].Money, Tozih = Rewards["acceptedrequest"].Tozih, xp = Rewards["acceptedrequest"].XP})
        --     else
        --         SendNUIMessage({action = "playerquest", label = "Quest [TAXI] [❌]", value = "acceptedrequest", cantquest = true ,Money = Rewards["acceptedrequest"].Money, Tozih = Rewards["acceptedrequest"].Tozih, xp = Rewards["acceptedrequest"].XP})
        --     end
        end
    end)
    SendNUIMessage({action = "openjob"})
end

function Process(cb, tx, OnWork,mod)
    if OnWork then ESX.ShowNotification("<span style='color:#c7c7c7'> Shoma Dar Hale Hazer Yek Quest Ra Accept Kardid <span style='color:#ff0000'></span>") return end
    cb(tx)
end

function StartQuest(data)
    if data == "PostChi" then --> TriggerEvent('KiaN_Quest:point','postchi',nil,amount)
        RunQuest(data, 'postchi','number',nil,nil,Medrandom," Tahvil Post Be Tedad +"..Medrandom.." Kala")
    elseif data == "BusDriver" then  --> TriggerEvent('KiaN_Quest:point','busdriver',nil,amount)
        RunQuest(data, 'busdriver','number',nil,nil,Medrandom," Resandan Mosaferan Be Maghsad Be Tedad +"..Medrandom)
    elseif data == "BaghBan" then --> TriggerEvent('KiaN_Quest:point','baghban',nil,amount)
        RunQuest(data, 'baghban','number',nil,nil,Medrandom," Anjam Kar +"..Medrandom.." Nafar")
    elseif data == "MiveChin" then -->TriggerEvent('KiaN_Quest:point','mivechin',nil,amount)
        RunQuest(data, 'mivechin','number',nil,nil,minirandom," Forosh Mive Be Tedad +"..minirandom)
    elseif data == "GhoreKeshi" then -->TriggerEvent('KiaN_Quest:point','ghorekeshi',nil,amount)
        RunQuest(data, 'ghorekeshi','number',nil,nil,minirandom," Sherkat Dar Ghore Keshi Be Tedad +"..minirandom)
    elseif data == "KharidBTC" then -->TriggerEvent('KiaN_Quest:point','kharidbtc',nil,amount)
        RunQuest(data, 'kharidbtc','number',nil,nil,minirandom," Kharid Yek Arz Be Tedad +"..minirandom)
    elseif data == "RobDrug" then   --> TriggerEvent('KiaN_Quest:point','robdrug',nil,1)
        RunQuest(data, 'robdrug','number',nil,nil,minirandom," Be Tedad +"..minirandom.. " Drug Bedozdid")
    elseif data == "UseDrug" then -->TriggertEvent('KiaN_Quest:point','usedrug','',1)
        RunQuest(data, 'usedrug','item',drug,math.random(1,5),minirandom,"  Be Tedade : "..minirandom.." in Drug Ra Use Konid : ")
    elseif data == "StartRob" then --> TriggerEvent('KiaN_Quest:point','startrob','NameRob',1)
        RunQuest(data, 'startrob','item',robs,math.random(1,3),1," In Robbery Ra Start Konid : ")
    elseif data == "SellDrug" then -->TriggerEvent('KiaN_Quest:point','selldrug',item.id,1)
        RunQuest(data, 'selldrug','item',drug,math.random(1,5),minirandom,"  Be Tedade : "..minirandom.."  in Drug Ra Befroshid : ")
    elseif data == "Revive" then -->TriggerClientEvent('KiaN_Quest:point',source,'revive',xPlayer.job.name,1)
        RunQuest(data, 'revive','item',RevivePlayerJob,math.random(1,4),tenrandmon,"  Be Tedade : "..tenrandmon.."  Player Ba In Job Revive Konid  : ")
    elseif data == "heal" then -->TriggerClientEvent('KiaN_Quest:point',source,'Heal',nil,1)
        RunQuest(data, 'Heal','item',RevivePlayerJob,math.random(1,4),tenrandmon,"  Be Tedade : "..tenrandmon.."  Player Ba In Job Heal Konid  : ")
    elseif data == "repair" then --> TriggerClientEvent('KiaN_Quest:point',source,'Repair',nil,1)
        RunQuest(data, 'Repair','number',nil,nil,tenrandmon,"  Be Tedade : "..tenrandmon.." Mashin Repair Konid")
    elseif data == "clean" then --> TriggerClientEvent('KiaN_Quest:point',source,'Clean',nil,1)
        RunQuest(data, 'Clean','number',nil,nil,tenrandmon,"  Be Tedade : "..tenrandmon.." Mashin Repair Konid")
    -- elseif data == "acceptedrequest" then -->TriggerClientEvent('KiaN_Quest:point',source,'Acceptedrequest',nil,1)
    --     RunQuest(data, 'Acceptedrequest','number',nil,nil,tenrandmon,"  Be Tedade : "..minirandom.." Darkhast Accept Konid")
    elseif data == "Patrol" then 
        if PlayerData.job.name == 'police' or PlayerData.job.name == 'fbi' then 
            local Dir1 = 0 
            local Dir2 = 0
            local Dir3 = 0
                local mathE  = math.random(1,3)
                for k,v in pairs(Roads) do 
                   if math.random(1,3) == k then 
                    Wait(100)
                  Dir1 = v
                  Wait(100)
                  if math.random(1,3) == k then 
                    Dir1 = v
                    end
                   end
                end
                Wait(300)
                for k,v in pairs(Roads) do 
                    if math.random(4,7) == k then 
                        Wait(100)
                   Dir2 = v
                   Wait(100)
                   if math.random(4,7) == k then 
                    Dir2 = v
                end
                    end
                 end
                 Wait(300)
                for k,v in pairs(Roads) do 
                    if math.random(8,10) == k then 
                        Wait(100)
                   Dir3 = v
                  Wait(100)
                  if math.random(8,10) == k then 
                    Dir3 = v
                end
                    end
                 end
                 Wait(300)
              if Dir1 == 0 then 
               Dir1 = vector3(226.655, 201.6659, 105.3231)
              end
              if Dir2 == 0 then 
                Dir2 = vector3(921.2703, -182.9275, 74.06665)
              end 
              if Dir3 == 0 then 
                Dir3 = vector3(-620.2681, -923.9868, 23.04541)
              end 
            PatrolQuest(Dir1,Dir2,Dir3,vector3(416.6637, -1024.563, 29.24609))
        elseif PlayerData.job.name == 'sheriff' then  -- ShRoads
            local Dir1 = 0 
            local Dir2 = 0
            local Dir3 = 0
                local mathE  = math.random(1,3)
                for k,v in pairs(ShRoads) do 
                   if math.random(1,3) == k then 
                    Wait(100)
                  Dir1 = v
                  Wait(100)
                  if math.random(1,3) == k then 
                    Dir1 = v
                    end
                   end
                end
                Wait(300)
                for k,v in pairs(Roads) do 
                    if math.random(4,7) == k then 
                        Wait(100)
                   Dir2 = v
                   Wait(100)
                   if math.random(4,7) == k then 
                    Dir2 = v
                end
                    end
                 end
                 Wait(300)
                for k,v in pairs(Roads) do 
                    if math.random(8,10) == k then 
                        Wait(100)
                   Dir3 = v
                  Wait(100)
                  if math.random(8,10) == k then 
                    Dir3 = v
                end
                    end
                 end
                 Wait(300)
              if Dir1 == 0 then 
               Dir1 =  vector3(-138.5011, 6458.268, 31.45349)
              end
              if Dir2 == 0 then 
                Dir2 = vector3(1201.556, 2677.305, 37.72156)
              end 
              if Dir3 == 0 then 
                Dir3 = vector3(2577.349, 364.589, 108.4572)
              end 
            PatrolQuest(Dir1,Dir2,Dir3,vector3(-442.1275, 6036.132, 31.33557))
        end 
    elseif data == "security" then 
    local pos  = nil 
if PlayerData.job.name == 'police' or PlayerData.job.name == 'fbi' then 
   for k,v in pairs(PoliceScurity) do 
      if math.random(1,5) == k then 
       pos = v 
      end 
    end
elseif PlayerData.job.name == 'sheriff' then 
   for k,v in pairs(SheirffScurity) do 
     if math.random(1,2) == k  then 
      pos = v 
      end
    end 
end 
        Wait(710)
        SecurityPlace(pos)
    end
 
end
RegisterNetEvent('KiaN_Quest:startquestfromdatabase')
AddEventHandler('KiaN_Quest:startquestfromdatabase', function(listgetshode, point)
    RunQuest(listgetshode.data, listgetshode.name, listgetshode.model, listgetshode.table, listgetshode.key, listgetshode.number, listgetshode.txt)
    Wait(700)
    Nitem = point
end)
RegisterNetEvent('KiaN_Quest:setshans')
AddEventHandler('KiaN_Quest:setshans', function(listgetshode)
    shans = listgetshode.shans
    shans2 = listgetshode.shans2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    TriggerServerEvent('KiaN_Quest:checkendtime', GetPlayerServerId(PlayerId()))
    Wait(500)
    TriggerServerEvent('KiaN_Quest:startquestdatabase', GetPlayerServerId(PlayerId()))
    ESX.TriggerServerCallback("KiaN_Quest:GetLevelAndXP", function(PlayerData)
        if PlayerData ~= nil then
            PlayerData.Level = PlayerData.Level
            PlayerData.XP    = PlayerData.XP
            if PlayerData.Level == 0 then
                Thread = true
                NoWeapons()
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 0 Ast! Nemitavanid Az Gun Estefade Konid <span style='color:#ff0000'></span>")
            elseif PlayerData.Level == 1 then
                Thread = true
                LimitedWeapons()
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 1 Ast! Faghat Az Pistol Mitavanid Estefade Konid <span style='color:#ff0000'></span>")
            end
        end
    end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
    PlayerData.gang = gang
end)

RegisterNetEvent('KiaN_Quest:OnPlayerLevelChange')
AddEventHandler('KiaN_Quest:OnPlayerLevelChange', function(lvl, xp)
    ESX.TriggerServerCallback("KiaN_Quest:GetLevelAndXP", function(PlayerData)
        if PlayerData ~= nil then
            if PlayerData.Level < lvl then
                ESX.ShowNotification("<span style='color:#c7c7c7'> [Tabrik] Level Shoma Az "..PlayerData.Level.." Be "..lvl.." Afzayesh Yaft <span style='color:#ff0000'></span>!")
            elseif PlayerData.Level >= lvl then
                ESX.ShowNotification("<span style='color:#c7c7c7'> [Warning] Level Shoma Az "..PlayerData.Level.." Be "..lvl.." Kahesh Yaft <span style='color:#ff0000'></span>!")
            end
            Thread = false
            PlayerData.Level = lvl
            PlayerData.XP    = xp
            Wait(5000)
            if PlayerData.Level == 0 then
                Thread = true
                NoWeapons()
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 0 Ast! Nemitavanid Az Gun Estefade Konid <span style='color:#ff0000'></span>!")
            elseif PlayerData.Level == 1 then
                Thread = true
                LimitedWeapons()
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 1 Ast! Faghat Az Pistol Mitavanid Estefade Konid <span style='color:#ff0000'></span>!")
            else
                Thread = false
                NoWeapons()
                LimitedWeapons()
                NoLimitWeapons()
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma "..PlayerData.Level.." Ast! Az Har Guni Ke Dost Darid Estefade Konid <span style='color:#ff0000'></span>!")
            end
        end
    end)
end)

function NoWeapons()
    Citizen.CreateThread(function()
        while Thread do
            Citizen.Wait(750)
            DisableControlAction(0, 37, true)
            DisableControlAction(1, 37, true)
            DisableControlAction(2, 37, true)
            SetPedCanSwitchWeapon(PlayerPedId(), false)
            if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("WEAPON_UNARMED") then
                Citizen.Wait(75)
                SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
                Citizen.Wait(75)
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 0 Ast! Nemitavanid Az Gun Estefade Konid <span style='color:#ff0000'></span>!")
            end
        end
    end)
end

function LimitedWeapons()
    Citizen.CreateThread(function()
        DisableControlAction(0, 37, false)
        DisableControlAction(1, 37, false)
        DisableControlAction(2, 37, false)
        EnableControlAction(0, 37, true)
        EnableControlAction(1, 37, true)
        EnableControlAction(2, 37, true)
        SetPedCanSwitchWeapon(PlayerPedId(), true)
        while Thread do
            Citizen.Wait(750)
            local CanEquip = false
            for k, v in pairs(Guns) do
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(k) then
                    CanEquip = true
                end
            end
            if not CanEquip then
                Citizen.Wait(75)
                SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
                Citizen.Wait(75)
                ESX.ShowNotification("<span style='color:#c7c7c7'> Level Shoma 1 Ast! Faghat Az Pistol Mitavanid Estefade Konid <span style='color:#ff0000'></span>!")
            end
        end
    end)
end

function NoLimitWeapons()
    Citizen.CreateThread(function()
        DisableControlAction(0, 37, false)
        DisableControlAction(1, 37, false)
        DisableControlAction(2, 37, false)
        EnableControlAction(0, 37, true)
        EnableControlAction(1, 37, true)
        EnableControlAction(2, 37, true)
        SetPedCanSwitchWeapon(PlayerPedId(), true)
    end)
end

RegisterNetEvent('RankUpMessage')
AddEventHandler('RankUpMessage', function(MsgText, setCounter)
	local scaleform = RequestScaleformMovie("mp_big_message_freemode")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end
	BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	BeginTextComponent("STRING")
	AddTextComponentString(MsgText)
	EndTextComponent()
	PopScaleformMovieFunctionVoid()	
	local counter = 0
	local maxCounter = (setCounter or 200)
	while counter < maxCounter do
		counter = counter + 1
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(0)
	end
end)
---------------------------------------------------------------
----------------------Player Quest
---------------------------------------------------------------

function RunQuest(data, name,model,table,key,NuMbeR,txt)
    OnQuest = true 
    QuestName = name 
    Max = NuMbeR 
   TriggerServerEvent('KiaN_Quest:startquestindatabase', GetPlayerServerId(PlayerId()), 'true', data, name,model,table,key,NuMbeR,txt, shans, shans2)
if model == 'number' then -->  TriggerClientEvent('KiaN_Quest:point',source,)
    print("Quest : "..txt)
    ESX.ShowNotification("<span style='color:#c7c7c7'>Quest : "..txt.." ")
    CreateThread(function()
        while OnQuest == true do
               Wait(5000)
           if Nitem >= NuMbeR  then 
         ESX.ShowNotification("<span style='color:#c7c7c7'>Quest Done <span style='color:#069a19'><b>+5xp</b></span>!")
          QuestEnd(Rewards[data])
          return 
           end
         end
 end)
elseif model == 'item' then 
    for k,v in pairs(table) do 
        if key == k then 
            item = v 
            break
         end
    end
    Wait(710)
 print("Quest : "..txt..item)
ESX.ShowNotification("<span style='color:#c7c7c7'>"..txt..item.." ")
    CreateThread(function()
        while OnQuest == true do
               Wait(5000)
           if Nitem >= NuMbeR  then 
         ESX.ShowNotification("<span style='color:#c7c7c7'>Quest Done <span style='color:#069a19'><b>+5xp</b></span>!")
         QuestEnd(Rewards[data])
          return 
           end
         end
      end)
  end
end
function SecurityPlace(Direction)
    OnQuest = true 
local Warn = 0 
local inloction = false 
local End = false 
local min = 5
local sec = 59 
ESX.ShowNotification("<span style='color:#c7c7c7'>Be Makan  <span style='color:#069a19'><b>Mark</b></span> Shod Bervaid!")
    CreateThread(function()
        while OnQuest do 
            Wait(1000)
            SetNewWaypoint(Direction.x,Direction.y)
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),Direction) < 100 then  
                inloction = true  
                sec = sec - 1 
                if min == 0 and sec == 0 then 
                    End = true 
                 end 
                if sec == 0 then 
                    min = min - 1 
                    sec = 59 
                end 
                
                ESX.ShowMissionText("~r~Remaining Time : ~y~ "..min.." ~w~:~y~ "..sec)
              while End == true  do 
                Wait(10)
                End = false
                if OnQuest == true and inloction == true then 
                    ESX.ShowMissionText("~g~ Done")
                    ESX.ShowNotification("<span style='color:#c7c7c7'>Quest Done <span style='color:#069a19'><b>+5xp</b></span>!")
                    QuestEnd(Rewards["security"])
                    return 
                end
              end 
            else 
                if inloction == true  then 
                    Warn = Warn + 1
                    ESX.ShowNotification("<span style='color:#c7c7c7'>Shoma Az Mantaghe <span style='color:#ff0000'>Kharj</span> Shodid!"..Warn.."/5")
                       Wait(3000)
                    if Warn == 5 then 
                        OnQuest = false 
                        ESX.ShowMissionText("~r~Remaining Time : ~y~ Cancel Shod")
                        inloction = false 
                        return
                    end
                end
            end 
        end
    end)
  
end 

function PatrolQuest(Direction1,Direction2,Direction3,Direction4)
    OnQuest = true 
    local level = 1
    ESX.ShowNotification("<span style='color:#c7c7c7'> go to the <b> location </b>!")
    CreateThread(function()
        while OnQuest do 
            Wait(3000)
            if level == 1 then 
                SetNewWaypoint(Direction1.x,Direction1.y)
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),Direction1,false) < 10 then 
                level = 2
                ESX.ShowNotification("<span style='color:#c7c7c7'> go to the next location <b>"..level.." /4</b>!")
                
            end 
        elseif level == 2 then 
            SetNewWaypoint(Direction2.x,Direction2.y)
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),Direction2,false) < 10 then 
                level = 3
                ESX.ShowNotification("<span style='color:#c7c7c7'> go to the next location <b>"..level.."/4</b>!")
            end 
        elseif level == 3 then 
        SetNewWaypoint(Direction3.x,Direction3.y)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),Direction3,false) < 10 then 
            level = 4
            ESX.ShowNotification("<span style='color:#c7c7c7'> go to the next location <b>"..level.."/4</b>!")
        end 
    elseif level == 4 then 
        SetNewWaypoint(Direction4.x,Direction4.y)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),Direction4,false) < 10 then 
            level = 4
            ESX.ShowNotification("<span style='color:#c7c7c7'> go to the next location <b>"..level.."/4</b>!") 
            QuestEnd(Rewards["Patrol"])
            Wait(710)
            ESX.ShowNotification("<span style='color:#c7c7c7'>Quest Done <span style='color:#069a19'><b>+5xp</b></span>!")
            return 
        end 
        end
    end
    end)
end 
function QuestEnd(data)
    TriggerServerEvent("KiaN_Quest:done", data.XP, data.Money)
    OnQuest = false 
    Nitem = 0 
    item = nil 
    Medrandom  = math.random(10,20)
    minirandom = math.random(1,3) 
    highrandom = math.random(50,80) 
    QuestName = nil
    Max = 0 
    Wait(500)
    ESX.TriggerServerCallback("KiaN_Quest:GetLevelAndXP", function(PlayerData)
        if PlayerData ~= nil then
            PlayerData.Level = PlayerData.Level
            PlayerData.XP    = PlayerData.XP
            if PlayerData.XP >= Levels[PlayerData.Level + 1] then
                TriggerEvent('RankUpMessage', 'Shoma Level Up Shodid', 500)
                TriggerServerEvent('KiaN_Quest:levelupshodbaquestend', GetPlayerServerId(PlayerId()))
            end
        end
    end)
end

RegisterNetEvent("KiaN_Quest:point") 
AddEventHandler("KiaN_Quest:point",function(name,nameitem,number) 
   
 if name ~= QuestName then return end
   if nameitem ~= nil then 
     if nameitem == item then 
    Nitem =  Nitem + number 

     end 
    elseif nameitem == nil then 
        Nitem =  Nitem + number 
    end 
Wait(710)
    TriggerServerEvent('KiaN_Quest:savequestpointindatabase', GetPlayerServerId(PlayerId()), Nitem)
    ESX.ShowNotification("<span style='color:#c7c7c7'>Save Shod  <span style='color:#069a19'><b>+"..Nitem.."</b></span></span><b>/ "..Max.."</b>!")
end)
