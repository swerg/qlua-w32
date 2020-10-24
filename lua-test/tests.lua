require("w32")


message("GetUserName=[" .. w32.GetUserName() .. "]")
message("WM_COMMAND=" .. w32.WM_COMMAND)
message("WM_SYSCOMMAND=" .. w32.WM_SYSCOMMAND)
message("WM_CLOSE=" .. w32.WM_CLOSE)
