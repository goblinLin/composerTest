-----------------------------------------------------------------------------------------
--
-- main.lua
-- 本範例示範如何使用Composer架構來製作頁面切換的效果	
-- Author: Zack Lin
-- Time: 2015/5/1
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )
--要使用Composer架構必須要先用require指令來匯入Lib
local composer = require( "composer" )
--=======================================================================================
--宣告各種變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}

local str_game = "神魔之塔 V8.0"
local img_loading

local onClick
--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
	img_loading = display.newImageRect( "loading.jpg", _SCREEN.WIDTH, _SCREEN.HEIGHT )
	img_loading.x = _SCREEN.CENTER.X
	img_loading.y = _SCREEN.CENTER.Y


	Runtime:addEventListener( "touch", onClick )
end

--=======================================================================================
--定義其他函式
--=======================================================================================
onClick =  function ( event )
	if("ended" == event.phase) then
		img_loading:removeSelf( )
		img_loading = nil
		--透過設定Variable的機制將變數傳到其他Scene
		composer.setVariable( "game", str_game )
		--將舞台轉移到scene1場景
		composer.gotoScene( "scene1" )
		Runtime:removeEventListener( "touch", onClick )
	end
	
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()