﻿#Persistent
#CommentFlag //

// Автор сего скрипта: vk.com/idDrygok
// При копировании и распространении просьба указывать автора


global processName := "grand_theft_auto_san_andreas.dll" // Имя процесса для CR:MP 0.3e - если Вы используете скрипт в других играх, тут нужно указать заголовок процесса. Например, для SA-MP это gta_sa.exe

global texts := [] // Список текстов для воспроизведения при переключении на новое оружие
current := -1 // Текущее (последнее) оружие, которое было в руках

start:
{
	// Формат: texts.Push[["Первое действие, когда игрок убрал это оружие", "Второе действие, когда игрок убрал это оружие", ...], ["Первое действие, когда игрок достал это оружие", "Второе действие, когда игрок достал это оружие", ...]]])
	// texts.Push() добавляет массив массивов строк в переменную texts для дальнейшего воспроизведения
	
	texts.Push([[], ["/me сжал кулаки"]])
	texts.Push([["/me снял кастет и убрал его в карман в сумку и закрыл ее"], ["/me надел кастет", "/do Кастет готов к применению"]])
	texts.Push([["/me убрал клюшку в сумку и закрыл ее"], ["/do Клюшка за спиной", "/me взял клюшку в руки"]])
	texts.Push([["/me убрал дубинку в сумку и закрыл ее"], ["/do Дубинка висит на поясе", "/me снял дубинку с пояса"]])
	texts.Push([["/me убрал нож в сумку и закрыл ее"], ["/me достал нож", "/do На лице видны ярость и отчаяние"]])
	texts.Push([["/me убрал биту в сумку и закрыл ее"], ["/me легким замахом достал биту из-за спины"]])
	texts.Push([["/me убрал лопату в сумку и закрыл ее"], ["/do Лопата висит за спиной", "/me снял лопату и взял ее за черенок"]])
	texts.Push([["/me убрал кий в сумку и закрыл ее"], ["/do Кий висит за спиной", "/me снял кий и взял его в руку"]])
	texts.Push([["/me аккуратно положил тесак в сумку"], ["/me вытащил огромный тесак из-за спины"]])
	texts.Push([["/me выключил бензопилу и убрал ее в сумку"], ["/me взял бензопилу и завел ее", "/do Слышен скрежет мусора, попадающего под цепь"]])
	texts.Push([["/me спрятал дилдо в сумку и закрыл ее"], ["/me достал двухсторонний дилдо и приготовился к его применению"]])
	texts.Push([["/me убрал вибратор в сумку и закрыл ее"], ["/do Короткий вибратор в кармане", "/me достал короткий вибратор и включил его"]])
	texts.Push([["/me убрал вибратор в сумку и закрыл ее"], ["/do Длинный вибратор в кармане", "/me достал длинный вибратор и включил его"]])
	texts.Push([["/me спрятал дилдо в сумку и закрыл ее"], ["/me достал белый дилдо и приготовился к его применению"]])
	texts.Push([["/me убрал цветы в сумку и закрыл ее"], ["/me взял цветы в руки"]])
	texts.Push([["/me убрал топор в сумку и закрыл ее"], ["/do Топор висит за спиной", "/me снял топор и взял его в правую руку"]])
	texts.Push([["/me убрал гранату в сумку и закрыл ее"], ["/do Граната закреплена на поясе", "/me взял гранату в руки"]])
	texts.Push([["/me убрал гранату в сумку и закрыл ее"], ["/do Дымовая граната закреплена на поясе", "/me взял дымовую гранату в руки"]])
	texts.Push([["/me убрал гранату в сумку и закрыл ее"], ["/do Коктейль Молотова закреплен на поясе", "/me взял коктейль Молотова в руки"]])
	texts.Push([[], ["/me достал неизвестное оружие"]])
	texts.Push([[], ["/me достал неизвестное оружие"]])
	texts.Push([[], ["/me достал неизвестное оружие"]])
	texts.Push([["/me поставил пистолет на предохранитель и убрал его в сумку"], ["/do Пистолет закреплен на поясе", "/me схватил пистолет в правую руку"]])
	texts.Push([["/me поставил пистолет на предохранитель и убрал его в сумку"], ["/do Пистолет с глушителем закреплен на поясе", "/me схватил пистолет с глушителем в правую руку"]])
	texts.Push([["/me поставил пистолет на предохранитель и убрал его в сумку"], ["/do Пистолет 'Пустынный орел' закреплен на поясе", "/me взял в руки пистолет 'Пустынный орел' и приготовился стрелять"]])
	texts.Push([["/me поставил дробовик на предохранитель и убрал его в сумку"], ["/do Дробовик 'Shotgun' висит за спиной", "/me быстрым движением схватил дробовик 'Shotgun' и приготовился стрелять"]])
	texts.Push([["/me поставил дробовик на предохранитель и убрал его в сумку"], ["/do Двуствольный дробовик висит за спиной", "/me быстрым движением схватил дробовик и приготовился стрелять"]])
	texts.Push([["/me поставил дробовик на предохранитель и убрал его в сумку"], ["/do Боевой дробовик висит за спиной", "/me быстрым движением схватил дробовик и приготовился стрелять"]])
	texts.Push([["/me поставил полуавтомат на предохранитель и убрал его в сумку", "/do Руки свободны"], ["/do Полуавтомат 'UZI' закреплен на поясе", "/me выхватил полуавтомат 'UZI' и приготовился к бою"]])
	texts.Push([["/me поставил полуавтомат на предохранитель и убрал его в сумку"], ["/do Полуавтомат 'MP5' закреплен на поясе", "/me выхватил полуавтомат 'MP5' и приготовился к бою"]])
	texts.Push([["/me поставил автомат на предохранитель и убрал его в сумку"], ["/do Автомат 'AK-47' висит за спиной", "/me снял автомат 'AK-47' и взял его в обе руки"]])
	texts.Push([["/me поставил автомат на предохранитель и убрал его в сумку"], ["/do Автомат 'Винторез' висит за спиной", "/me снял автомат 'Винторез' и взял его в обе руки"]])
	texts.Push([["/me поставил пистолет-пулемет на предохранитель и убрал его в сумку"], ["/do Пистолет-пулемет 'TEC9' закреплен на поясе", "/me взял пистолет-пулемет 'TEC9' в правую руку"]])
	texts.Push([["/me поставил винтовку на предохранитель и убрал ее в сумку"], ["/do Винтовка висит за спиной", "/me взял винтовку в руки"]])
	texts.Push([["/me поставил винтовку на предохранитель и убрал ее в сумку"], ["/do Снайперская винтовка висит за спиной", "/me взял снайперскую винтовку в руки"]])
	texts.Push([["/me спрятал РПГ в сумку"], ["/do РПГ закрелен висит за спиной", "/me взял РПГ в руки"]])
	texts.Push([["/me спрятал ракетницу в сумку"], ["/do Самонаводящаяся ракетница висит за спиной", "/me взял самонаводящуюся ракетницу в руки"]])
	texts.Push([["/me спрятал огнемет в сумку"], ["/do Огнемет висит за спиной", "/me взял огнемет в руки"]])
	texts.Push([["/me спрятал пулемет в сумку"], ["/do Тяжелый пулемет висит за спиной", "/me снял тяжелый пулемет и приготовился к бою"]])
	texts.Push([["/me спрятал пакет со взрывчаткой в сумку"], ["/do Пакет со взрывчаткой закреплен на поясе", "/me снял пакет со взрывчаткой и взял его в руку"]])
	texts.Push([["/me спрятал детонатор в сумку"], ["/do Детонатор лежит в кармане", "/me сунул руку в карман и достал детонатор"]])
	texts.Push([["/me спрятал балончик краски в сумку"], ["/do Балончик краски закреплен на поясе", "/me взял балончик краски в руки"]])
	texts.Push([["/me спрятал огнетушитель в сумку"], ["/do Огнетушитель висит за спиной", "/me взял огнетушитель в руки"]])
	texts.Push([["/me спрятал фотоаппарат в сумку"], ["/do Фотоаппарат висит на поясе", "/me взял фотоаппарат в руки"]])
	SetTimer, cw, 100
}

cw:
{
	weapon := getWeaponId()
	
	if ((weapon == -1) || (weapon == current) || (getStatus() == 0))
		return
	
	if (current > 0) {
		playWeapon(current, 1)
	}

	current := weapon
	playWeapon(current, 2)
}

playWeapon(id, type) { // id - ID оружия для отыгровки, type - тип действия (1 - убрал, 2 - достал)
	array := texts[id + 1][type] // В AHK массивы начинаются 1, поэтому тексты для нулевого оружия будут с индексом 1
	for t in array
	{
		sleep 3500 // Время задержки между отыгровкой каждого из оружий в мс (стандартные 3500мс - 3.5с), целое число, больше нуля
		sendChat(texts[id + 1][type][t])
	}
	
}

sendChat(text) {
	WinGet, WIN, ProcessName, A
	if (WIN != processName)
		return
	SendMessage, 0x50,, 0x4190419,, A
	SendInput {F6}%text%{Enter}
}

getWeaponId() {
   return ProcessReadMemory(0xBAA410, processName)
}

getStatus() {
	return ProcessReadMemory(ProcessReadMemory(0xB6F5F0, processName) + 0x15C, processName)
}

ProcessReadMemory(address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
        return -1
    if !processHandle := DllCall("OpenProcess", "Int", 24, "UInt", 0, "UInt", processID, "Ptr")
        return -1
    result := DllCall("ReadProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "PtrP", numBytesRead, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
        return -1
    if !result
        return -1
    if !numBytesRead
        return -1
    return (type = "Str")
        ? StrGet(&buf, numBytes)
        : NumGet(buf, type)
}