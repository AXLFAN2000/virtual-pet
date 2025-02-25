pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
    hero={hp=10,mp=10,zzz=10}--stats
    bars={hp=102,mp=102,zzz=102}--default bar locations
    btncd=100
    --debug below
    --[[posf={x=63,y=63}--posfinder]]
end
 
function _update()
    calcbars()--calculates bar fill
    btnpress()
    --debug below
    --[[posfinder()]]
    valdebug()--modify value directly
end

function _draw()
    cls()--clear screen
    map()--load map
    drawbars()--fills the bars
    --ui buttons
    spr(4,51,91)
    spr(5,60,90)
    spr(6,70,91)
    if btncd<0 then
        spr(11,48,91)
    end
    --debug below
    --print(btncd,0,0,1)
    --[[spr(0,posf.x,posf.y)--posfinder
    print(posf.x,0,0,1)--posfinder
    print(posf.y)--posfinder]]
end

--new functions below

function btnpress()
    btncd-=2
    if btn(➡️) and btncd<0 then
        hero.zzz+=3
        btncd=100
        end
    if btn(⬅️) and btncd<0 then
        hero.hp+=3
        btncd=100
    end
    if btn(⬆️) and btncd<0 then
        hero.mp+=3
        btncd=100
    end
end

function calcbars()
    --hp bar
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
    elseif hero.hp==1 then
        bars.hp=26
    elseif hero.hp==0 then
        bars.hp=25
    end
    --mp bar
    if hero.mp>9 then
        bars.mp=102
    elseif hero.mp>8 then
        bars.mp=94
    elseif hero.mp>7 then
        bars.mp=86
    elseif hero.mp>6 then
        bars.mp=78
    elseif hero.mp>5 then
        bars.mp=70
    elseif hero.mp>4 then
        bars.mp=62
    elseif hero.mp>3 then
        bars.mp=54
    elseif hero.mp>2 then
        bars.mp=38
    elseif hero.mp>1 then
        bars.mp=30
    elseif hero.mp==1 then
        bars.mp=26
    elseif hero.mp==0 then
        bars.mp=25
    end
    --zzz bar
    if hero.zzz>9 then
        bars.zzz=102
    elseif hero.zzz>8 then
        bars.zzz=94
    elseif hero.zzz>7 then
        bars.zzz=86
    elseif hero.zzz>6 then
        bars.zzz=78
    elseif hero.zzz>5 then
        bars.zzz=70
    elseif hero.zzz>4 then
        bars.zzz=62
    elseif hero.zzz>3 then
        bars.zzz=54
    elseif hero.zzz>2 then
        bars.zzz=38
    elseif hero.zzz>1 then
        bars.zzz=30
    elseif hero.zzz==1 then
        bars.zzz=26
    elseif hero.zzz==0 then
        bars.zzz=25
    end
end
    
function drawbars()
    rectfill(25,57,bars.hp,62,8)--hp bar
    print(hero.hp,104,57,8)
    rectfill(25,65,bars.mp,70,9)--mp bar
    print(hero.mp,104,65,9)
    rectfill(25,73,bars.zzz,78,10)--zzz bar
    print(hero.zzz,104,73,10)
end

--debug functions below
function valdebug() --modify value directly
    if btn(🅾️) and hero.hp>0 then
        hero.hp-=1
    end
    if btn(🅾️) and hero.mp>0 then
        hero.mp-=1
    end
    if btn(🅾️) and hero.zzz>0 then
        hero.zzz-=1
    end
end

--[[function posfinder()
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
end]]