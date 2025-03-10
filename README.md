
# FiveM Keybind handler

## Installation [EN]
- Download the latest release
- Extract the .zip file and add the `pmc-keybinds` to your resource folder
- Add to your .cfg file the `ensure pmc-keybinds`

## Usage [EN]
- Open your `fxmanifest.lua` file
- Add to `client_scripts` the keybind file `@pmc-keybinds/imports.lua`
- Inside any Lua client-side file use `RegisterKey(layout:string, keyname:string, mapname:string, onpress:function|nil, onrelease:function|nil, seclayout:string|nil, seckeyname:string|nil)`

## Instalación [ES]
- Descarga la última version
- Extrae el archivo .zip y añade `pmc-keybinds` a tu carpeta `resources`
- Añade a tu archivo .cfg `ensure pmc-keybinds`

## Uso [ES]
- Abre tu archivo `fxmanifest.lua`
- Añade a `client_scripts` el archivo `@pmc-keybinds/imports.lua`
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
