md .bin\x32
md .bin\x64-Lua51
md .bin\x64-Lua53
md .bin\x64-Lua54

copy build\VC2015\.build\Win32\Release\*.dll .bin\x32
copy build\VC2015\.build\x64\Release\*.dll .bin\x64-Lua51
copy build\VC2015\.build\x64\Release53\*.dll .bin\x64-Lua53
copy build\VC2015\.build\x64\Release54\*.dll .bin\x64-Lua54

copy nul .bin\ReadMe.txt
echo ���������� ���������� w32 ��� Lua. >> .bin\ReadMe.txt
echo ��������� �������� ��������� WinAPI ������� �� Lua. >> .bin\ReadMe.txt
echo ��������� ��������: https://quik2dde.ru/viewtopic.php?id=78 >> .bin\ReadMe.txt
echo. >> .bin\ReadMe.txt
echo \x32       -- ��� QUIK 6.x, 7.x >> .bin\ReadMe.txt
echo \x64-Lua51 -- ��� QUIK 8.0-8.4 >> .bin\ReadMe.txt
echo \x64-Lua53 -- ��� QUIK 8.5 � ����� ��� ������ Lua5.3 ��� ���������� ������� >> .bin\ReadMe.txt
echo \x64-Lua54 -- ��� QUIK 8.11 � ����� ��� ������ Lua5.4 ��� ���������� ������� >> .bin\ReadMe.txt

del /Q w32.dll.zip 

cd .bin
"C:\Program Files\7-Zip\7z.exe" a -r -tZip ..\w32.dll.zip *.dll ReadMe.txt
cd ..

rd /S /Q .bin