w32z = require("w32")

message("GetUserName=[" .. w32z.GetUserName() .. "]")
message("WM_COMMAND=" .. w32z.WM_COMMAND)
message("WM_SYSCOMMAND=" .. w32z.WM_SYSCOMMAND)
message("WM_CLOSE=" .. w32z.WM_CLOSE)
