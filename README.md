# bg_imagecanvas

<img width="1672" height="941" alt="bgimagecanvas" src="https://github.com/user-attachments/assets/62671c9a-d7d5-46f7-b7bb-b6186019ad24" />

https://youtu.be/xOCg412nKak

BG Image Canvas è uno script semplice, leggero e immersivo che permette ai giocatori di creare tele personalizzate direttamente dall’inventario.

Utilizzando una Tela Vuota, il player può inserire un link immagine da Imgur o FiveManage e trasformarla in una Tela Personalizzata. L’immagine viene salvata nei metadata dell’item, rendendo ogni tela unica e riutilizzabile in qualsiasi momento.

Perfetto per server roleplay che vogliono aggiungere oggetti creativi, collezionabili, quadri personalizzati, foto evento, documenti visivi o item legati alla lore del server.

Caratteristiche principali:

• Creazione canvas tramite link immagine
• Supporto Imgur e FiveManage
• Integrazione con ox_inventory
• Metadata salvati sull’item
• Item unici e non stackabili
• UI NUI semplice e moderna
• Notifiche tramite ox_lib
• Script leggero e facile da configurare

Dipendenze:

• ox_inventory
• ox_lib

Ideale per gallerie d’arte RP, business in-game, eventi, collezionabili e contenuti personalizzati.

# ox_inventory items

`['canvas_blank'] = {
    label = 'Tela Vuota',
    weight = 100,
    stack = true,
    close = true,
    description = 'Una tela bianca su cui potrai applicare un\'immagine.',
    client = {
        export = 'bg_imagecanvas.useBlank'
    }
},

['canvas_custom'] = {
    label = 'Tela Personalizzata',
    weight = 100,
    stack = false,
    close = true,
    description = 'Una tela con un\'immagine personalizzata.',
    client = {
        export = 'bg_imagecanvas.useCustom'
    }
},
`
