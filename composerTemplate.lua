--引入Composer API
local composer = require("composer")
--從composer生出新的場景
local scene = composer.newScene() 

--畫面沒到螢幕上時，先呼叫scene:create，負責UI畫面繪製
function scene:create( event )
	--把場景的view存在sceneGroup這個變數裡
	local sceneGroup = self.view

	--接下來把會出現在畫面的東西，加進sceneGroup裡面
end

--畫面到螢幕上時，呼叫scene:show
--移除前一個場景，播放音效，開始計時，播放各種動畫
function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if( phase == "will") then
		--畫面即將要推上螢幕時要執行的程式碼寫在這邊
	elseif ( phase == "did") then
		--把畫面已經被推上螢幕後要執行的程式碼寫在這邊
		--可能是移除之前的場景，播放音效，開始計時，播放各種動畫

	end
end

--即將被移除，呼叫scene:hide，停止音樂，釋放音樂記憶體
function scene:hide( event )
	
	local sceneGroup = self.view
	local phase = event.phase

	if (phase == "will") then
		--畫面即將移開螢幕時，要執行的程式碼
		--這邊需要停止音樂，釋放音樂記憶體，有timer的計時器也可以在此停止
	elseif (phase == "did") then
		--畫面已經移開螢幕時，要執行的程式碼
	end
end

--下一個場景畫面推上螢幕後
--任務
function scene:destory( event )
	local sceneGroup = self.view
	--這邊寫下畫面要被消滅前要執行的程式碼
end

-----------------------------

--幫場景加上偵聽器
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destory", scene )

return scene