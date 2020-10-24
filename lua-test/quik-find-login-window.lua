require("w32")


-- Автологин терминала QUIK
-- (c) http://qui2dde.ru/
-- Версия: 2.0
-- для Quik от версии 7.11.1.5

local w32 = require("w32")

-- логин и пароль для терминала
QUIK_LOGIN = "логин"
QUIK_PASSW = "пароль"

function FindLoginWindow()
  hLoginWnd = w32.FindWindow("", "Идентификация пользователя")
  if hLoginWnd == 0 then
    hLoginWnd = w32.FindWindow("", "User identification")
  end
  return hLoginWnd
end

timeout = 1000  -- таймаут между попытками поиска окна логина
is_run = true

function OnStop()
  timeout = 1
  is_run = false
end

function main()
  while is_run do
    sleep(timeout)

    if isConnected() == 0 then
  
      local hLoginWnd = FindLoginWindow()
      if hLoginWnd ~= 0 then

        local n1 = w32.FindWindowEx(hLoginWnd, 0, "", "")
        local n2 = w32.FindWindowEx(hLoginWnd, n1, "", "")
        local n3 = w32.FindWindowEx(hLoginWnd, n2, "", "")
        local n4 = w32.FindWindowEx(hLoginWnd, n3, "", "")

        w32.SetWindowText(n2, QUIK_LOGIN)
        w32.SetWindowText(n3, QUIK_PASSW)


        w32.SetFocus(n4)
        w32.PostMessage(n4, w32.BM_CLICK, 0, 0)

      end 
    end

  end
end