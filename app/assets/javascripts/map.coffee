# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
	event.currentTarget.setAttribute('value', target.value)
	event.currentTarget.setAttribute('src', target.src)
	event.preventDefault()

# HTMLのDOMの読み込み完了後実行
$(document).on('ready page:load',  ->

	console.log 'ready'

	panels = document.getElementsByName('map_panel')		# マップ上のパネル
	obstacles = document.getElementsByName('obstacle')	# 障害物

	panels.forEach((panel, i) ->
		if(i != 0 && i != (panels.length-1))
			panel.addEventListener('dragover', eventOnDragOver)
			panel.addEventListener('drop', eventOnDrop)
	)

	obstacles.forEach((obstacle, i) ->
		obstacle.addEventListener('dragstart', eventOnDragStart)
	)

)
