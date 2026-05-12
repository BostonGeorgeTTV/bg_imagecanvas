local showingImage = false

-- Usa item "canvas_blank"
RegisterNetEvent('bg_imagecanvas:useBlank', function(item)
    local input = lib.inputDialog('Inserisci Immagine', {
        {type = 'input', label = 'Link Imgur / FiveManage', placeholder = 'https://i.imgur.com/xxxx.jpg'},
    })

    if not input or not input[1] or input[1] == '' then
        lib.notify({type = 'error', title = 'Errore', description = 'Link non valido'})
        return
    end
    TriggerServerEvent('bg_imagecanvas:createCanvas', item.slot, input[1])
end)

-- Usa item "canvas_custom"
RegisterNetEvent('bg_imagecanvas:useCustom', function(item)
    local slot = item.slot
    if not slot then
        lib.notify({type = 'error', title = 'Errore', description = 'Slot non trovato'})
        return
    end

    -- Richiede i metadata aggiornati al server
    lib.callback('bg_imagecanvas:getItemMetadata', false, function(metadata)
        if not metadata or not metadata.image then
            lib.notify({type = 'error', title = 'Errore', description = 'Immagine non trovata'})
            return
        end

        SetNuiFocus(true, true)
        showingImage = true
        SendNUIMessage({
            action = 'showImage',
            url = metadata.image
        })
    end, slot)
end)

useBlank = function(slot)
    TriggerEvent("bg_imagecanvas:useBlank", slot)
end
exports("useBlank", useBlank)

useCustom = function(slot)
    TriggerEvent("bg_imagecanvas:useCustom", slot)
end
exports("useCustom", useCustom)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    showingImage = false
    cb({})
end)
