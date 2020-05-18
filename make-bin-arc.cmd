md .bin\x32
md .bin\x64-Lua51
md .bin\x64-Lua53

copy build\VC2015\.build\Win32\Release\w32.dll .bin\x32
copy build\VC2015\.build\x64\Release\w32.dll .bin\x64-Lua51
copy build\VC2015\.build\x64\Release-Lua53\w32.dll .bin\x64-Lua53

cd .bin
"C:\Program Files\7-Zip\7z.exe" a -r -tZip ..\w32.dll.zip *.dll
cd ..


