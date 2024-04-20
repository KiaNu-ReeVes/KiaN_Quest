local ESX = nil
local Table = {}
local ListDatabase = {
}
local PlayerQuests = {
    ["BusDriver"]      = {},
    ["MiveChin"]         = {},
    ["BaghBan"]   = {},
    ["Test"]  = {},
    ["GhoreKeshi"]  = {},
    ["KharidBTC"]  = {},
}
local GnagQuests = {
    ["RobDrug"]      = {},
    ["UseDrug"]         = {},
    ["StartRob"]   = {},
    ["SellDrug"]  = {},
}
local JobsQuest = {
    ---Militry
    ["Patrol"]      = {},
    ["security"]         = {},
    ---ambulance 
    ["Revive"]      = {},
    ["heal"]       = {},
    ---Mecano
    ["repair"]   = {},
    ["clean"]  = {},
    ---taxi
    -- ["acceptedrequest"]  = {},

}



TriggerEvent('esx:getkianobject', function(obj) ESX = obj end)
ESX.RegisterServerCallback("KiaN_Quest:GetGangQuestStatus", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    AddAccountInDataBase(source)
    if GnagQuests["RobDrug"][xPlayer.identifier] == nil then
        Table["RobDrug"] = true
    else
        Table["RobDrug"] = false
    end
    if GnagQuests["UseDrug"][xPlayer.identifier] == nil then
        Table["UseDrug"] = true
    else
        Table["UseDrug"] = false
    end
    if GnagQuests["StartRob"][xPlayer.identifier] == nil then
        Table["StartRob"] = true
    else
        Table["StartRob"] = false
    end
    if GnagQuests["SellDrug"][xPlayer.identifier] == nil then
        Table["SellDrug"] = true
    else
        Table["SellDrug"] = false
    end
    cb(Table)
end)
ESX.RegisterServerCallback("KiaN_Quest:GetJobQuestStatus", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    AddAccountInDataBase(source)
    if JobsQuest["Patrol"][xPlayer.identifier] == nil then
        Table["Patrol"] = true
    else
        Table["Patrol"] = false
    end
    if JobsQuest["security"][xPlayer.identifier] == nil then
        Table["security"] = true
    else
        Table["security"] = false
    end
    if JobsQuest["Revive"][xPlayer.identifier] == nil then
        Table["Revive"] = true
    else
        Table["Revive"] = false
    end
    if JobsQuest["heal"][xPlayer.identifier] == nil then
        Table["heal"] = true
    else
        Table["heal"] = false
    end
    if JobsQuest["repair"][xPlayer.identifier] == nil then
        Table["repair"] = true
    else
        Table["repair"] = false
    end
    if JobsQuest["clean"][xPlayer.identifier] == nil then
        Table["clean"] = true
    else
        Table["clean"] = false
    end
    -- if JobsQuest["acceptedrequest"][xPlayer.identifier] == nil then
    --     Table["acceptedrequest"] = true
    -- else
    --     Table["acceptedrequest"] = false
    -- end
    cb(Table)
end)
ESX.RegisterServerCallback("KiaN_Quest:GetPlayerQuestStatus", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    AddAccountInDataBase(source)
    if PlayerQuests["BusDriver"][xPlayer.identifier] == nil then
        Table["BusDriver"] = true
    else
        Table["BusDriver"] = false
    end
    if PlayerQuests["MiveChin"][xPlayer.identifier] == nil then
        Table["MiveChin"] = true
    else
        Table["MiveChin"] = false
    end
    if PlayerQuests["BaghBan"][xPlayer.identifier] == nil then
        Table["BaghBan"] = true
    else
        Table["BaghBan"] = false
    end
    if PlayerQuests["Test"][xPlayer.identifier] == nil then
        Table["Test"] = true
    else
        Table["Test"] = false
    end
    if PlayerQuests["GhoreKeshi"][xPlayer.identifier] == nil then
        Table["GhoreKeshi"] = true
    else
        Table["GhoreKeshi"] = false
    end
    if PlayerQuests["KharidBTC"][xPlayer.identifier] == nil then
        Table["KharidBTC"] = true
    else
        Table["KharidBTC"] = false
    end
    cb(Table)
end)
ESX.RegisterServerCallback("KiaN_Quest:GetOnWork", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    AddAccountInDataBase(source)
    cb(xPlayer.get("OnQuest"))
end)
local levelandxp = {
    Level = 0,
    XP = 0
}
ESX.RegisterServerCallback("KiaN_Quest:GetLevelAndXP", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    Citizen.CreateThread(function() 
        MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @identifier',
        {
            ['@identifier'] = xPlayer.identifier

        }, function(data)
          if data[1] then
            levelandxp.Level = data[1].level
            levelandxp.XP = data[1].xp
            xPlayer.set("Level", data[1].level)
            xPlayer.set("XP", data[1].xp)
            cb(levelandxp)
          end
        end)
    end)
end)

RegisterServerEvent('KiaN_Quest:AcceptedQuest')
AddEventHandler('KiaN_Quest:AcceptedQuest', function(data,mod)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.set("OnQuest", true)
    if mod == 'Gnag' then 
        GnagQuests[data][xPlayer.identifier] = false
    elseif mod == 'player' then 
        PlayerQuests[data][xPlayer.identifier] = false
    elseif mod == 'job' then 
        JobsQuest[data][xPlayer.identifier] = false
    end
end)

RegisterServerEvent('KiaN_Quest:done')
AddEventHandler('KiaN_Quest:done', function(xp,money)
    local xPlayer = ESX.GetPlayerFromId(source) 
    xPlayer.set("OnQuest", false)
    TriggerEvent('KiaN_Quest:startquestindatabase', source, 'false')
    xPlayer.addBank(money)
    Citizen.CreateThread(function() 
        MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @identifier',
        {
            ['@identifier'] = xPlayer.identifier

        }, function(data)
          if data[1] then
            MySQL.Async.execute('UPDATE kian_quest SET xp = @xp WHERE steamhex = @identifier', 
            {
                ['@identifier'] = xPlayer.identifier,
                ['@xp']    = data[1].xp + xp,
            })
          end
        end)
    end)
    
end)
RegisterCommand("resetquest", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source) 
    local Target = ESX.GetPlayerFromId(tonumber(args[1]))
    if xPlayer.permission_level >= 10 then
        Target.set("OnQuest", false)
        -- TriggerEvent('KiaN_Quest:startquestindatabase', source, 'false')
    else
        ESX.ShowNotification('Shoma Dastresi Nadarid !')
    end
end)

RegisterCommand("setlevel", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Target = tonumber(args[1])
    if xPlayer.permission_level >= 8 then
        if tonumber(Target) then
            xTarget = ESX.GetPlayerFromId(Target)
            if xTarget then
                TriggerClientEvent("KiaN_Quest:OnPlayerLevelChange", Target, tonumber(args[2]), 0)
                Wait(500)
                xTarget.set('Level',tonumber(args[2]))
                xPlayer.set("XP", 0)
                MySQL.Async.execute('UPDATE kian_quest SET level = @level, xp = @xp WHERE steamhex = @identifier', 
                {
                    ['@identifier'] = xTarget.identifier,
                    ['@level']    = tonumber(args[2]),
                    ['@xp']    = 0,
                })
            end
        end
    end
end)
RegisterCommand("setxp", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Target = tonumber(args[1])
    if xPlayer.permission_level >= 8 then
        if tonumber(Target) then
            xTarget = ESX.GetPlayerFromId(Target)
            if xTarget then
                xPlayer.set("XP", tonumber(args[2]))
                MySQL.Async.execute('UPDATE kian_quest SET xp = @xp WHERE steamhex = @identifier', 
                {
                    ['@identifier'] = xTarget.identifier,
                    ['@xp']    = tonumber(args[2]),
                })
            end
        end
    end
end)

RegisterServerEvent("KiaN_Quest:startquestdatabase")
AddEventHandler("KiaN_Quest:startquestdatabase", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    AddAccountInDataBase(source)
    Wait(500)
    Citizen.CreateThread(function() 
        MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @identifier',
        {
            ['@identifier'] = xPlayer.identifier

        }, function(data)
          if data[1] then
            xPlayer.set("Level", data[1].level)
            local datainfo = json.decode(data[1].info)
                if data[1].inquest == 'true' then
                    xPlayer.set("OnQuest", true)
                    TriggerClientEvent('KiaN_Quest:startquestfromdatabase', source, datainfo, data[1].point)
                    TriggerClientEvent('esx:showNotification', source, 'Shoma Zamani Ke Az Server Kharej Shodid Dar Hal Anjam Quest Bodid')
                else
                    xPlayer.set("OnQuest", false)
                end
                if datainfo.saveallquests == nil then return end
                PlayerQuests["BusDriver"][xPlayer.identifier] = datainfo.saveallquests.playerq.BusDriver
                PlayerQuests["MiveChin"][xPlayer.identifier] = datainfo.saveallquests.playerq.MiveChin
                PlayerQuests["BaghBan"][xPlayer.identifier] = datainfo.saveallquests.playerq.BaghBan
                PlayerQuests["Test"][xPlayer.identifier] = datainfo.saveallquests.playerq.Test
                PlayerQuests["GhoreKeshi"][xPlayer.identifier] = datainfo.saveallquests.playerq.GhoreKeshi
                PlayerQuests["KharidBTC"][xPlayer.identifier] = datainfo.saveallquests.playerq.KharidBTC
                
                GnagQuests["RobDrug"][xPlayer.identifier] = datainfo.saveallquests.gangq.RobDrug
                GnagQuests["UseDrug"][xPlayer.identifier] = datainfo.saveallquests.gangq.UseDrug
                GnagQuests["StartRob"][xPlayer.identifier] = datainfo.saveallquests.gangq.StartRob
                GnagQuests["SellDrug"][xPlayer.identifier] = datainfo.saveallquests.gangq.SellDrug

                JobsQuest["Patrol"][xPlayer.identifier] = datainfo.saveallquests.jobq.Patrol
                JobsQuest["security"][xPlayer.identifier] = datainfo.saveallquests.jobq.security
                JobsQuest["Revive"][xPlayer.identifier] = datainfo.saveallquests.jobq.Revive
                JobsQuest["heal"][xPlayer.identifier] = datainfo.saveallquests.jobq.heal
                JobsQuest["repair"][xPlayer.identifier] = datainfo.saveallquests.jobq.repair
                JobsQuest["clean"][xPlayer.identifier] = datainfo.saveallquests.jobq.clean
                -- JobsQuest["acceptedrequest"][xPlayer.identifier] = datainfo.saveallquests.jobq.acceptedrequest

                TriggerClientEvent('KiaN_Quest:setshans', source, datainfo)
          end
        end)
    end)
end)
RegisterServerEvent("KiaN_Quest:levelupshodbaquestend")
AddEventHandler("KiaN_Quest:levelupshodbaquestend", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    Citizen.CreateThread(function() 
        MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @identifier',
        {
            ['@identifier'] = xPlayer.identifier

        }, function(data)
          if data[1] then
            MySQL.Async.execute('UPDATE kian_quest SET level = @level, xp = @xp WHERE steamhex = @identifier', 
            {
                ['@identifier'] = xPlayer.identifier,
                ['@level']    = data[1].level+1,
                ['@xp']    = 0,
            })
            Wait(500)
            TriggerClientEvent("KiaN_Quest:OnPlayerLevelChange", source, data[1].level+1, 0)
            xPlayer.set('Level',data[1].level+1)
            xPlayer.set("XP", 0)
          end
        end)
    end)
end)
RegisterServerEvent("KiaN_Quest:startquestindatabase")
AddEventHandler("KiaN_Quest:startquestindatabase", function(source, start, data, name,model,table,key,NuMbeR,txt, shans, shans2)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        ListDatabase.onquest = start
        ListDatabase.name = name
        ListDatabase.model = model
        ListDatabase.table = table
        ListDatabase.key = key
        ListDatabase.number = NuMbeR
        ListDatabase.txt = txt
        ListDatabase.data = data
        if shans then
        ListDatabase.shans = shans
        end
        if shans2 then
        ListDatabase.shans2 = shans2
        end
        if PlayerQuests["Test"][xPlayer.identifier] == false 
        or PlayerQuests["BaghBan"][xPlayer.identifier] == false 
        then
            ListDatabase.shans2 = 1
        elseif PlayerQuests["BusDriver"][xPlayer.identifier] == false 
        or PlayerQuests["MiveChin"][xPlayer.identifier] == false then
            ListDatabase.shans2 = 2
        else
            ListDatabase.shans2 = 3
        end
        if GnagQuests["RobDrug"][xPlayer.identifier] == false 
        or GnagQuests["UseDrug"][xPlayer.identifier] == false 
        then
            ListDatabase.shans = 1
        else
            ListDatabase.shans = 2
        end
        ListDatabase.timeend = os.date("%d")
        ListDatabase.saveallquests = {
            playerq = {
                BusDriver = PlayerQuests["BusDriver"][xPlayer.identifier],
                MiveChin = PlayerQuests["MiveChin"][xPlayer.identifier],
                BaghBan = PlayerQuests["BaghBan"][xPlayer.identifier],
                Test = PlayerQuests["Test"][xPlayer.identifier],
                GhoreKeshi = PlayerQuests["GhoreKeshi"][xPlayer.identifier],
                KharidBTC = PlayerQuests["KharidBTC"][xPlayer.identifier],
            },
            gangq = {
                RobDrug = GnagQuests["RobDrug"][xPlayer.identifier],
                UseDrug = GnagQuests["UseDrug"][xPlayer.identifier],
                StartRob = GnagQuests["StartRob"][xPlayer.identifier],
                SellDrug = GnagQuests["SellDrug"][xPlayer.identifier],
            },
            jobq = {
                Patrol = JobsQuest["Patrol"][xPlayer.identifier],
                security = JobsQuest["security"][xPlayer.identifier],
                Revive = JobsQuest["Revive"][xPlayer.identifier],
                heal = JobsQuest["heal"][xPlayer.identifier],
                repair = JobsQuest["repair"][xPlayer.identifier],
                clean = JobsQuest["clean"][xPlayer.identifier],
                -- acceptedrequest = JobsQuest["acceptedrequest"][xPlayer.identifier],
            }
        }
        MySQL.Async.execute('UPDATE kian_quest SET inquest = @inquest, info = @info, point = @point WHERE steamhex = @identifier', 
        {
            ['@identifier'] = xPlayer.identifier,
            ['@inquest']    = ListDatabase.onquest,
            ['@info']    = json.encode(ListDatabase),
            ['@point']    = 0,
        })
    end
end)

RegisterServerEvent("KiaN_Quest:checkendtime")
AddEventHandler("KiaN_Quest:checkendtime", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        Citizen.CreateThread(function() 
            MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @identifier',
            {
                ['@identifier'] = xPlayer.identifier
    
            }, function(data)
              if data[1] then
                local datainfo = json.decode(data[1].info)
                if datainfo.timeend ~= nil and datainfo.timeend < os.date("%d") then
                    TriggerClientEvent('esx:showNotification', source, 'Quest Haye Shoma Reset Shod !')
                    MySQL.Async.execute('UPDATE kian_quest SET inquest = @inquest, info = @info, point = @point WHERE steamhex = @identifier', 
                    {
                        ['@identifier'] = xPlayer.identifier,
                        ['@inquest']    = 'false',
                        ['@info']    = json.encode({onquest = false}),
                        ['@point']    = 0,
                    })
                end
              end
            end)
        end)
    end
end)

RegisterServerEvent("KiaN_Quest:savequestpointindatabase")
AddEventHandler("KiaN_Quest:savequestpointindatabase", function(source, Nitem)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.execute('UPDATE kian_quest SET point = @point WHERE steamhex = @identifier', 
        {
            ['@identifier'] = xPlayer.identifier,
            ['@point']    = Nitem,
        })
    end
end)

function AddAccountInDataBase(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM kian_quest WHERE steamhex = @Steam',
    {
        ['@Steam'] = xPlayer.identifier
  
    }, function(data) 
        if data[1] == nil then
          MySQL.Async.execute('INSERT INTO kian_quest (steamhex, level, xp, inquest, info, point) VALUES (@owner, @level, @xp, @inquest, @info, @point)',
          {
            ['@owner']   = xPlayer.identifier,
            ['@level']   = 0,
            ['@xp']   = 0,
            ['@inquest']   = 'false',
            ['@info']   = json.encode({}),
            ['@point']   = json.encode({}),
          }, function (rowsChanged)
          end)
        end 
    end)
end