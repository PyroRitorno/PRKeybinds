
# CFX/FiveM: PRKeybinds (fork of [pitermcflebor/pmc-keybinds](https://github.com/pitermcflebor/pmc-keybinds) keybind handler)

## Installation [EN]
- Download the latest release
- Extract the .zip file and add the `PRKeybinds` to your resource folder
- Add to your .cfg file the `ensure PRKeybinds`

## Usage [EN]
- Open your `fxmanifest.lua` file
- Add to `client_scripts` the keybind file `@PRKeybinds/imports.lua`
- Inside any Lua client-side file use `RegisterKey(layout:string, keyname:string, mapname:string, onpress:function|nil, onrelease:function|nil, seclayout:string|nil, seckeyname:string|nil)`

## Instalación [ES]
- Descarga la última version
- Extrae el archivo .zip y añade `PRKeybinds` a tu carpeta `resources`
- Añade a tu archivo .cfg `ensure PRKeybinds`

## Uso [ES]
- Abre tu archivo `fxmanifest.lua`
- Añade a `client_scripts` el archivo `@PRKeybinds/imports.lua`
- Dentro de cualquier archivo Lua client-side utiliza `RegisterKey(layout:string, keyname:string, mapname:string, onpress:function|nil, onrelease:function|nil, seclayout:string|nil, seckeyname:string|nil)`

## Example / Ejemplo
### example 1
```lua
RegisterKey(
    'keyboard', -- layout
    'E', -- keyname
    '_TEST_KEYBIND', -- mapname (keybind name)

    -- on-press
    function()
        print('key pressed 1')
    end,

    -- on-release
    function()
        print('key released')
    end
)
```
### example 2
```lua
RegisterKey('keyboard', 'E', '_TEST_KEYBIND_2',
function()
    print('key pressed 2')
end)
```
### example 3 (secondary keybind support!)
```lua
RegisterKey('mouse_button', 'mouse_left', '_TEST_KEYBIND_3',
function()
    print('pow!')
end,
nil,
'PAD_DIGITALBUTTON', 'R2_INDEX')
```
### example 4 (can use only on-press or on-release if needed!)
```lua
RegisterKey('mouse_button', 'mouse_right', '_TEST_KEYBIND_4',
nil,
function()
    print('bleh !')
end,
'PAD_DIGITALBUTTON', 'L2_INDEX')
```
### example 5 (binding chat command to keybind manager)
```lua
RegisterKeyFromCommand('keyboard', "f5", 'Open Admin Menu', 'easyadmin')

RegisterKeyFromCommand(
    'keyboard', -- layout
    'rshift', -- keyname
    'Crouch', -- mapname (keybind name)
    'emote crouch', -- on-press command
    'emote clear' -- on-release command
)
```
### example 6 (event callback; support for non-lua scripts)
```lua
-- both sets of callbacks should work within client scripts
-- i havent testing if these callbacks work in server scripts, but im sure they will throw many errors / not work

TriggerEvent('PRKeybinds:RegisterKey', layout, keyname, mapname, onpressfunc, onreleasefunc, seclayout, seckeyname)
TriggerEvent('PRKeybinds:RegisterKeyCMD', layout, keyname, mapname, onpresscmd, onreleasecmd, seclayout, seckeyname)

TriggerEvent('RegisterKey', layout, keyname, mapname, onpressfunc, onreleasefunc, seclayout, seckeyname)
TriggerEvent('RegisterKeyCMD', layout, keyname, mapname, onpresscmd, onreleasecmd, seclayout, seckeyname)
```
