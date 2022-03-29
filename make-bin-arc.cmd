md .bin\x32
md .bin\x64-Lua51
md .bin\x64-Lua53
md .bin\x64-Lua54

copy build\VC2015\.build\Win32\Release\*.dll .bin\x32
copy build\VC2015\.build\x64\Release\*.dll .bin\x64-Lua51
copy build\VC2015\.build\x64\Release53\*.dll .bin\x64-Lua53
copy build\VC2015\.build\x64\Release54\*.dll .bin\x64-Lua54

copy nul .bin\ReadMe.txt
echo Библиотека расширения w32 для Lua. >> .bin\ReadMe.txt
echo Позволяет вызывать некоторые WinAPI функций из Lua. >> .bin\ReadMe.txt
echo Подробное описание: https://quik2dde.ru/viewtopic.php?id=78 >> .bin\ReadMe.txt
echo. >> .bin\ReadMe.txt
echo \x32       -- для QUIK 6.x, 7.x >> .bin\ReadMe.txt
echo \x64-Lua51 -- для QUIK 8.0-8.4 >> .bin\ReadMe.txt
echo \x64-Lua53 -- для QUIK 8.5 и далее при выборе Lua5.3 для выполнении скрипта >> .bin\ReadMe.txt
echo \x64-Lua54 -- для QUIK 8.11 и далее при выборе Lua5.4 для выполнении скрипта >> .bin\ReadMe.txt

del /Q w32.dll.zip 

cd .bin
"C:\Program Files\7-Zip\7z.exe" a -r -tZip ..\w32.dll.zip *.dll ReadMe.txt
cd ..

rd /S /Q .bin