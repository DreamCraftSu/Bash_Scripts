#!/bin/bash
FOLDERS_SERVERS="/home/servers" #Путь до папки с серверами
BORDER="5000"
# Сервер || Паппка|| База || Screen
arr=(
	"Mystic Mystic mystic Mystic"
	"MysticRPG MysticRPG mysticRPG MysticRPG"
	"SandBox SandBox sandbox SandBox"
	"Techno Techno techno Techno"
	"TechnoMystic technomystic dream_technoMystic TechnoMystic"
	"DraconicTech draconictech dream_draconic DraconicTech")
count_serv=${#arr[@]}
for (( i=0; i<${count_serv}; i++ ));
do
    IFS=' ' read -r -a array <<< "${arr[$i]}";
    Name=${array[0]}
    Folder=${array[1]}
    Scr=${array[3]}
    echo "Number $i Server: ${Name}" 
done

read number
IFS=' ' read -r -a array_select <<< "${arr[$number]}";
Name=${array_select[0]}
Folder=${array_select[1]}
Scr=${array_select[3]}
echo "Прогрузка сервера $name"

echo "Запуск $FOLDERS_SERVERS/$Folder/start.sh"
sh $FOLDERS_SERVERS/$Folder/start.sh
sleep 1m
echo "Прогрузка сервера $name"
/usr/bin/screen -p 0 -S "${Scr}" -X eval 'stuff "wb world set '$BORDER' 0 0\015"'
echo "Установили границы"
/usr/bin/screen -p 0 -S "${Scr}" -X eval 'stuff "wb world fill 200\015"'
echo "Началась!"
/usr/bin/screen -p 0 -S "${Scr}" -X eval 'stuff "wb fill confirm\015"'
