# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# マップデータを隠しフィールドに保存
updateMapData = ->
	map_arr = []
	window.panels.forEach( (panel, i) ->
		# もしパネルがマップの左端であれば二次元リストに新しい行を作る
		if(panel.id.split(':')[1] is '0')
			map_arr.push([panel.getAttribute('value')])
		else
			map_arr[map_arr.length-1].push(panel.getAttribute('value'))
	)
	document.forms[0].elements.map_map_data.value = JSON.stringify(map_arr)
	console.log document.forms[0].elements.map_map_data.value

# ドラッグ開始時の処理
eventOnDragStart = (event) ->
	console.log 'drag start'
	transfer = event.dataTransfer
	transfer.setData('text/plain', event.target.id)

# ドラッグ要素がドロップ要素に重なっている間の処理
eventOnDragOver = (event) ->
	console.log 'drag over'
	event.preventDefault()

# ドロップ時の処理
eventOnDrop = (event) ->
	console.log 'dropped'
	target = document.getElementById(event.dataTransfer.getData('text/plain'))
	event.currentTarget.setAttribute('value', target.getAttribute('value'))
	event.currentTarget.setAttribute('src', target.src)
	updateMapData();
	event.preventDefault()

# HTMLのDOMの読み込み完了後実行
$(document).on('ready page:load',  ->

	console.log 'ready'

	window.panels = document.getElementsByName('map_panel')		# マップ上のパネル
	window.obstacles = document.getElementsByName('obstacle')	# 障害物

	window.panels.forEach((panel, i) ->
		if(i != 0 && i != (panels.length-1))
			panel.addEventListener('dragover', eventOnDragOver)
			panel.addEventListener('drop', eventOnDrop)
	)

	window.obstacles.forEach((obstacle, i) ->
		obstacle.addEventListener('dragstart', eventOnDragStart)
	)

	updateMapData();

)
