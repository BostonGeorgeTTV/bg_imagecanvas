local ox_inventory = exports.ox_inventory

RegisterNetEvent('bg_imagecanvas:createCanvas', function(slot, image)
    local src = source
    local metadata = {
        image = image,
        type = 'clean',
        created = os.time()
    }

    -- Rimuove la tela vuota dallo slot corretto
    local removed = ox_inventory:RemoveItem(src, 'canvas_blank', 1, nil, slot)
    if not removed then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Errore',
            description = 'Impossibile rimuovere la tela vuota.',
            type = 'error'
        })
        return
    end

    -- Aggiunge l'item personalizzato
    local added = ox_inventory:AddItem(src, 'canvas_custom', 1, metadata)
    if not added then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Errore',
            description = 'Inventario pieno o errore durante la creazione.',
            type = 'error'
        })
        return
    end

    -- Attendi un frame per permettere l'aggiornamento dell'inventario
    Wait(150)

    -- Cerca TUTTE le tele personalizzate
    local items = ox_inventory:Search(src, 'slots', 'canvas_custom')

    -- Trova quella senza metadata o appena creata (logica: immagine uguale)
    local createdItem
    for slotId, itm in pairs(items) do
        if itm.metadata and itm.metadata.image == image then
            createdItem = itm
            break
        end
    end

    -- Se non trova, prova fallback: prendi la più recente (slot più alto)
    if not createdItem then
        local maxSlot = 0
        for s, _ in pairs(items) do
            if s > maxSlot then maxSlot = s end
        end
        createdItem = items[maxSlot]
    end

    -- Ora scrivi o conferma i metadata
    if createdItem then
        ox_inventory:SetMetadata(src, createdItem.slot, metadata)
    else
        print('⚠️ Nessun item canvas_custom trovato dopo AddItem()')
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Canvas Creato',
        description = 'Hai creato una tela personalizzata!',
        type = 'success'
    })
end)


lib.callback.register('bg_imagecanvas:getItemMetadata', function(source, slot)
    local item = exports.ox_inventory:GetSlot(source, slot)
    if item and item.metadata then
        return item.metadata
    end
    return nil
end)
