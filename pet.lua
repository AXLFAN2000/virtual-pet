pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
    hero={hp=10,mp=10,zzz=10}--stats
    bars={hp=102,mp=102,zzz=102}--default bar locations
    --debug below
    posf={x=63,y=63}--posfinder 
end
 
function _update()
    calcbars()--calculates bar fill
    --debug below
    posfinder()
    valdebug()--modify value directly
end

function _draw()
    cls()--clear screen
    map()--load map
    drawbars()--fills the bars
    --debug below
    spr(0,posf.x,posf.y)--posfinder
    print(posf.x)--posfinder
    print(posf.y)--posfinder
end

--new functions below

function calcbars()
    if hero.hp>9 then
        bars.hp=102
    elseif hero.hp>8 then
        bars.hp=94
    elseif hero.hp>7 then
        bars.hp=86
    elseif hero.hp>6 then
        bars.hp=78
    elseif hero.hp>5 then
        bars.hp=70
    elseif hero.hp>4 then
        bars.hp=62
    elseif hero.hp>3 then
        bars.hp=54
    elseif hero.hp>2 then
        bars.hp=38
    elseif hero.hp>1 then
        bars.hp=30
    end
end
    
function drawbars()
    rectfill(25,57,bars.hp,62,8)--hp bar
end

--debug functions below
function valdebug() --modify value directly
    if btn(❎) and hero.hp<10 then
        hero.hp+=1
    end
    if btn(🅾️) and hero.hp>0 then
        hero.hp-=1
    end
end

function posfinder()
    if btn(➡️) then
        posf.x+=1
        end
    if btn(⬅️) then
        posf.x-=1
    end
    if btn(⬇️) then
        posf.y+=1
    end
    if btn(⬆️) then
        posf.y-=1
    end
end