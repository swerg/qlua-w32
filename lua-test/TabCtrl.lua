w32 = require("w32")

-- Возвращает handle главного окна QUIK или 0 при ошибке
-- Если запущено несколько терминалов - выбирается тот QUIK, из которого запущен наш скрипт
function GetQuikMainWindowHandle()
	local hQuikWnd = 0
	while true do
		hQuikWnd = w32.FindWindowEx(0, hQuikWnd, "InfoClass", "")
		if hQuikWnd == 0 then
			break
		end
		local t,WinProcId = w32.GetWindowThreadProcessId(hQuikWnd)
		if WinProcId == w32.GetCurrentProcessId() then
			break
		end
	end

	return hQuikWnd
end

-- Простая тестовая функция создания окна с таблицей
function CreateTableWindow(caption)
	local t_id = AllocTable()   
	AddColumn(t_id, 0, "1", true, QTABLE_INT_TYPE, 15)
	AddColumn(t_id, 1, "2", true, QTABLE_INT_TYPE, 15)
	local t = CreateWindow(t_id)
	SetWindowCaption(t_id, caption)
	InsertRow(t_id, -1)
	SetCell(t_id, 1, 1, "<<" .. caption .. ">>")
end

-- Основной код

hQuikWnd = GetQuikMainWindowHandle()

hTabWnd = 0  -- здесь будет handle окна вкладок

if hQuikWnd > 0 then
	hTabWnd = w32.FindWindowEx(hQuikWnd, 0, "SysTabControl32", "")
	if hTabWnd ~= 0 and not w32.IsWindowVisible(hTabWnd) then
		-- Если окно вкладок найдено, но отображение вкладок отключено - сбросим в 0
		hTabWnd = 0
	end
end

if hTabWnd > 0 then
	-- Если вкладки в терминале отображаются
	-- Сохраним индекс текущей активной вкладки
	local prevIdx = w32.TabCtrl_GetCurFocus(hTabWnd)

	-- Получим индекс вкладки с именем "Графики"
	local idxGr = w32.TabCtrl_GetItemIndexByText(hTabWnd, "Графики")
	if idxGr >= 0 then
		-- Если вкладка "Графики" найдена
		-- переключимся на неё и создадим таблицу на ней
		w32.TabCtrl_SetCurFocus(hTabWnd, idxGr)
		CreateTableWindow("Вкладка 'Графики'")
	end

	-- Получим общее количество вкладок
	cnt = w32.TabCtrl_GetItemCount(hTabWnd)
	for i = 0, cnt-1 do
		-- Переключаемся поочередно на каждую вкладку и создаем таблицу с именем вкладки
		w32.TabCtrl_SetCurFocus(hTabWnd, i)
		-- Получим название вкладки
		-- т.к. получаем название текущей активной вкладки (только что на нее переключились),
		-- то второй параметр можно не указывать
		local txt = w32.TabCtrl_GetItemText(hTabWnd, i)
		CreateTableWindow(txt)
	end

	-- Переключимся назад на исходную вкладку
	w32.TabCtrl_SetCurFocus(hTabWnd, prevIdx)
else
	-- Если вкладки в терминале не отображаются
	CreateTableWindow("Вкладки отключены")
end
