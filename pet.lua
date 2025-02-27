pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()
    hero={hp=10,mp=10,zzz=10}--stats
    bars={hp=102,mp=102,zzz=102}--default bar locations
    btncd=60
    btnp={hp=false,mp=false,zzz=false,cd=30}
    eventcd=120
    --debug below
    --[[posf={x=63,y=63}--posfinder]]
end
 
function _update()
    calcbars()--calculates bar fill
    btnpress()
    event()
    if hero.hp>10 then
        hero.hp=10
    end
    if hero.mp>10 then
        hero.mp=10
    end
    if hero.zzz>10 then
        hero.zzz=10
    end
    --debug below
    --[[posfinder()]]
    --valdebug()--modify value directly
end

function _draw()
    cls()--clear screen
    map()--load map
    drawbars()--fills the bars
    --ui buttons
    if btnp.hp==true then
        spr(20,51,91)
        spr(23,16,56)
    elseif btnp.hp==false then
        spr(4,51,91)
        spr(7,16,56)
    end
    if btnp.mp==true then
        spr(21,60,90)
        spr(24,16,64)
    elseif btnp.mp==false then
        spr(5,60,90)
        spr(8,16,64)
    end
    if btnp.zzz==true then
        spr(22,70,91)
        spr(25,16,72)
    elseif btnp.zzz==false then
        spr(6,70,91)
        spr(9,16,72)
    end
    if btncd==0 then
        spr(11,48,91)
    end
    --debug below
    --print(eventcd,0,0,1)
    --print(mprnd)
    --[[spr(0,posf.x,posf.y)--posfinder
    print(posf.x,0,0,1)--posfinder
    print(posf.y)--posfinder]]
end

--new functions below

function event()
    if eventcd>0 then
        eventcd-=1
    end
    if eventcd==0 then
    hero.hp-=1+flr(rnd(3))
    mprnd=1+flr(rnd(2))
        if mprnd==1 then
        hero.mp-=1
        end
    hero.zzz-=1
    eventcd=120
    end
end

function eventcd()

end

function btnpress()
    if btncd>0 then
        btncd-=1
    end
    if btnp.cd>0 then
        btnp.cd-=5
    end
    if btnp.cd==0 then
        btnp.hp=false
        btnp.mp=false
        btnp.zzz=false
    end
    if btn(⬅️) and btncd==0 then
        hero.hp+=3
        btncd=60
        btnp.hp=true
        btnp.cd=30
        sfx(0)
    end
    if btn(➡️) and btncd==0 then
        hero.zzz+=3
        btncd=60
        btnp.zzz=true
        btnp.cd=30
        sfx(2)
        end

    if btn(⬆️) and btncd==0 then
        hero.mp+=3
        btncd=60
        btnp.mp=true
        btnp.cd=30
        sfx(1)
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