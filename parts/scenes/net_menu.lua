local scene={}

function scene.sceneInit()
    BG.set()
end
function scene.sceneBack()
    NET.ws_close()
end

function scene.draw()
    drawSelfProfile()
    drawOnlinePlayerCount()
end

scene.widgetList={
    WIDGET.newKey{name='setting',  x=1200,y=160,w=90, h=90,code=goScene'setting_game',font=60,fText=CHAR.icon.settings},
    WIDGET.newButton{name='league',x=640, y=180,w=350,h=120,font=40,color='D',code=goScene'net_league'},
    WIDGET.newButton{name='ffa',   x=640, y=360,w=350,h=120,font=40,color='D',code=function() MES.new('warn',text.notFinished)--[[NET.enterRoom({name='ffa'})]] end},
    WIDGET.newButton{name='rooms', x=640, y=540,w=350,h=120,font=40,code=goScene'net_rooms'},
    WIDGET.newButton{name='logout',x=880, y=40,w=180, h=60,color='dR',
        code=function()
            if tryBack() then
                USER.__data.uid=false
                USER.__data.email=false
                USER.__data.password=false
                USER.__data.rToken=false
                USER.__data.aToken=false
                love.filesystem.remove('conf/user')
                NET.ws_close()
                SCN.back()
            end
        end},
    WIDGET.newButton{name='back',  x=1140,y=640,w=170,h=80,sound='back',font=60,fText=CHAR.icon.back,code=backScene},
}

return scene
