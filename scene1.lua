-----------------------------------------------------------------------------------------
--
-- scene1.lua
-- 神魔之塔戰鬥盤場景
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
local scene = composer.newScene( )
--=======================================================================================
--宣告各種變數
--=======================================================================================
local img_game
local bgMusic = audio.loadStream( "bg_game.mp3")
local lb_game
local gotoScene2
--=======================================================================================
--定義各種函式
--=======================================================================================
gotoScene2 = function (  )
    local options = {
       effect = "fade",
       time = 500,
       isModal = true,
   }
   composer.showOverlay( "scene2", options ) --示範用Overlay的方式來顯示新的場景
end

function hello(  )
    print( 'hello world' )
end
--=======================================================================================
--Composer
--=======================================================================================

--畫面沒到螢幕上時，先呼叫scene:create
--任務:負責UI畫面繪製
function scene:create(event)
    print( 'scene1:create' )
    --把場景的view存在sceneGroup這個變數裡
    local sceneGroup = self.view

    --接下來把會出現在畫面的東西，加進sceneGroup裡面，這個非常重要
    
    img_game = display.newImageRect( "game.jpg" , _SCREEN.WIDTH, _SCREEN.HEIGHT )
    img_game.x = _SCREEN.CENTER.X
    img_game.y = _SCREEN.CENTER.Y
    sceneGroup:insert( img_game )

    local tmp = composer.getVariable( "game" )
    composer.getVariable( "loading" ):removeSelf( )
    lb_game = display.newText( tmp , _SCREEN.CENTER.X , _SCREEN.HEIGHT - 20 ,  system.nativeFont , 24 )
    lb_game:setFillColor( 1 , 1 , 1 )
    sceneGroup:insert( lb_game )

end


--畫面到螢幕上時，呼叫scene:show
--任務:移除前一個場景，播放音效，開始計時，播放各種動畫
function  scene:show( event)

    local sceneGroup = self.view
    local phase = event.phase

    if( "will" == phase ) then
        print( 'scene1:show will')
        --畫面即將要推上螢幕時要執行的程式碼寫在這邊
        --audio.play( bgMusic)
        img_game:addEventListener( "tap", gotoScene2)
    elseif ( "did" == phase ) then
        print( 'scene1:show did')
        --把畫面已經被推上螢幕後要執行的程式碼寫在這邊
        --可能是移除之前的場景，播放音效，開始計時，播放各種動畫
        
    end
end


--即將被移除，呼叫scene:hide
--任務:停止音樂，釋放音樂記憶體，停止移動的物體等
function scene:hide( event )
    
    local sceneGroup = self.view
    local phase = event.phase

    if ( "will" == phase ) then
        print( 'scene1:hide will')
        --畫面即將移開螢幕時，要執行的程式碼
        --這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止
        --audio.stop(bgMusic)
        --audio.dispose( bgMusic )
        bgMusic = nil
        
    elseif ( "did" == phase ) then
        print( 'scene1:hide did')
        --畫面已經移開螢幕時，要執行的程式碼

    end
end

--下一個場景畫面推上螢幕後
--任務:摧毀場景
function scene:destory( event )
    if ("will" == event.phase) then
        --這邊寫下畫面要被消滅前要執行的程式碼

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destory", scene )

return scene