&НаКлиенте
Перем ВидыНаборовДанных;

&НаКлиенте
Перем ВидыПолейНаборовДанных;

#Область СобытияФормы
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ИнициализироватьФорму();
КонецПроцедуры

#КонецОбласти

#Область СобытияЭлементовФормы
&НаКлиенте
Процедура НаборыДанныхПередНачаломИзменения(Элемент, Отказ)
	Если Элементы.НаборыДанных.ТекущаяСтрока = ИдентификаторНулевогоНабораДанных Тогда
		Отказ=Истина;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура НаборыДанныхПриАктивизацииСтроки(Элемент)
	ТекДанныеНабора=Элементы.НаборыДанных.ТекущиеДанные;
	Если ТекДанныеНабора = Неопределено Тогда
		Возврат;
	КонецЕсли;
	Если ТекДанныеНабора.Вид = ВидыНаборовДанных.Корень Тогда
		Элементы.ГруппаНаборыДанныхПраваяПанель.ТекущаяСтраница=Элементы.ГруппаНаборыДанныхПраваяПанельИсточникиДанных;
		Возврат;
	КонецЕсли;

	Элементы.ГруппаНаборыДанныхПраваяПанель.ТекущаяСтраница=Элементы.ГруппаНаборыДанныхПраваяПанельДанныеНабора;

	ТекДанныеНабора=Элементы.НаборыДанных.ТекущиеДанные;
	Элементы.ГруппаПанельРедактированияНастроекНабора.Видимость=ТекДанныеНабора.Вид <> ВидыНаборовДанных.Объединение;
	Если ТекДанныеНабора.Вид = ВидыНаборовДанных.Запрос Тогда
		Элементы.ГруппаПанельРедактированияНастроекНабора.ТекущаяСтраница=Элементы.ГруппаСтраницаРедактированияНастроекНабораЗапрос;
	ИначеЕсли ТекДанныеНабора.Вид = ВидыНаборовДанных.Объект Тогда
		Элементы.ГруппаПанельРедактированияНастроекНабора.ТекущаяСтраница=Элементы.ГруппаСтраницаРедактированияНастроекНабораОбъект;
	КонецЕсли;

	Элементы.ПоляНаборДанныхПроверкиИерархии.СписокВыбора.Очистить();
	Элементы.ПоляНаборДанныхПроверкиИерархии.СписокВыбора.Добавить("");

	Для Каждого Набор Из НаборыДанныхВерхнегоУровня() Цикл
		Если Набор.Имя = ТекДанныеНабора.Имя Тогда
			Продолжить;
		КонецЕсли;

		Элементы.ПоляНаборДанныхПроверкиИерархии.СписокВыбора.Добавить(Набор.Имя);
	КонецЦикла;

	ЗаполнитьСписокВыбораИсточникаДанныхНабора();

КонецПроцедуры

&НаКлиенте
Процедура НаборыДанныхЗапросПриИзменении(Элемент)
	ЗаполнитьПоляНабораДанныхПриИзмененииЗапроса(Элементы.НаборыДанных.ТекущаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура ГруппаЗакладкиРедактораПриСменеСтраницы(Элемент, ТекущаяСтраница)
	Если ТекущаяСтраница = Элементы.ГруппаСтраницаСвязиНаборовДанных Тогда
		ЗаполнитьВспомогательныеДанныеСвязейНаборовДанных();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СвязиНаборовДанныхНаборДанныхИсточникПриИзменении(Элемент)
	ТекДанные=Элементы.СвязиНаборовДанных.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ЗаполнитьСписокВыбораПоляСвязиНаборов(ТекДанные.НаборДанныхИсточник, Элементы.СвязиНаборовДанныхВыражениеИсточник);
КонецПроцедуры

&НаКлиенте
Процедура СвязиНаборовДанныхНаборДанныхПриемникПриИзменении(Элемент)
	ТекДанные=Элементы.СвязиНаборовДанных.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ЗаполнитьСписокВыбораПоляСвязиНаборов(ТекДанные.НаборДанныхПриемник, Элементы.СвязиНаборовДанныхВыражениеПриемник);
КонецПроцедуры

&НаКлиенте
Процедура СвязиНаборовДанныхПередНачаломИзменения(Элемент, Отказ)
	ТекДанные=Элементы.СвязиНаборовДанных.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ЗаполнитьСписокВыбораПоляСвязиНаборов(ТекДанные.НаборДанныхИсточник, Элементы.СвязиНаборовДанныхВыражениеИсточник);
	ЗаполнитьСписокВыбораПоляСвязиНаборов(ТекДанные.НаборДанныхПриемник, Элементы.СвязиНаборовДанныхВыражениеПриемник);

КонецПроцедуры
&НаКлиенте
Процедура ДоступныеПоляРесурсовВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	СтандартнаяОбработка=Ложь;

	ДобавитьРесурс(ВыбраннаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура ВычисляемыеПоляПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	ЗаполнитьВспомогательныеДанныеРесурсов();
КонецПроцедуры

&НаКлиенте
Процедура ВычисляемыеПоляПослеУдаления(Элемент)
	ЗаполнитьВспомогательныеДанныеРесурсов();
КонецПроцедуры

&НаКлиенте
Процедура РесурсыПередНачаломИзменения(Элемент, Отказ)
	ЗаполнитьСписокВыбораВыраженияРесурса(Элемент.ТекущаяСтрока);
КонецПроцедуры

&НаКлиенте
Процедура РесурсыВыражениеОткрытие(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка=Ложь;
	ТекДанные=Элементы.Ресурсы.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ДопПараметры=Новый Структура;
	ДопПараметры.Вставить("ИдентификаторСтроки", Элементы.Ресурсы.ТекущаяСтрока);

	УИ_ОбщегоНазначенияКлиент.ОткрытьФормуРедактированияТекста(ТекДанные.Выражение,
		Новый ОписаниеОповещения("РесурсыВыражениеОткрытиеЗавершение", ЭтотОбъект, ДопПараметры),
		"Редактирование выражения ресурса для " + ТекДанные.ПутьКДанным);
КонецПроцедуры

&НаКлиенте
Процедура РесурсыГруппировкиНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка=Ложь;
	ТекДанные=Элементы.Ресурсы.ТекущиеДанные;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	СписокДоступныхГруппировок=Новый СписокЗначений;
	Для Каждого Стр Из ДоступныеПоляРесурсов Цикл
		Пометка= ТекДанные.Группировки.НайтиПоЗначению(Стр.ПутьКДанным) <> Неопределено;
		СписокДоступныхГруппировок.Добавить(Стр.ПутьКДанным, , Пометка);
	КонецЦикла;

	Пометка= ТекДанные.Группировки.НайтиПоЗначению("ОбщийИтог") <> Неопределено;

	СписокДоступныхГруппировок.Добавить("ОбщийИтог", "Общий итог", Пометка);

	ДопПараметры=Новый Структура;
	ДопПараметры.Вставить("ИдентификаторСтроки", Элементы.Ресурсы.ТекущаяСтрока);

	УИ_ОбщегоНазначенияКлиент.ОткрытьФормуВыбораЭлементовСпискаЗначений(СписокДоступныхГруппировок,
		Новый ОписаниеОповещения("РесурсыГруппировкиНачалоВыбораЗавершение", ЭтотОбъект, ДопПараметры),
		"Поля группировки", , РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ДобавитьНаборДанныхЗапрос(Команда)
	ДобавитьНаборДанных(ВидыНаборовДанных.Запрос);
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьНаборДанныхОбъект(Команда)
	ДобавитьНаборДанных(ВидыНаборовДанных.Объект);
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьНаборДанныхОбъединение(Команда)
	ДобавитьНаборДанных(ВидыНаборовДанных.Объединение);
КонецПроцедуры

&НаКлиенте
Процедура УдалитьНаборДанных(Команда)
	ИдентификаторТекущейСтроки=Элементы.НаборыДанных.ТекущаяСтрока;
	Если ИдентификаторТекущейСтроки = ИдентификаторНулевогоНабораДанных Тогда
		Возврат;
	КонецЕсли;

	СтрокаНабораДанных=НаборыДанных.НайтиПоИдентификатору(ИдентификаторТекущейСтроки);
	СтрокаРодитель=СтрокаНабораДанных.ПолучитьРодителя();
	СтрокаРодитель.ПолучитьЭлементы().Удалить(СтрокаНабораДанных);
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьКонструкторЗапроса(Команда)
	ТекНабор=Элементы.НаборыДанных.ТекущиеДанные;
	Если ТекНабор = Неопределено Тогда
		Возврат;
	КонецЕсли;
	Конструктор=Новый КонструкторЗапроса(ТекНабор.Запрос);

	ДопПараметрыОповещения=Новый Структура;
	ДопПараметрыОповещения.Вставить("ТекСтрока", Элементы.НаборыДанных.ТекущаяСтрока);

	Конструктор.Показать(Новый ОписаниеОповещения("ОткрытьКонструкторЗапросаЗавершение", ЭтотОбъект,
		ДопПараметрыОповещения));
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьРесурсИзДоступных(Команда)
	ТекДанные=Элементы.ДоступныеПоляРесурсов.ТекущаяСтрока;
	Если ТекДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ДобавитьРесурс(ТекДанные);
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьЧисловыеРесурсыИзДоступных(Команда)
	Для Каждого Стр Из ДоступныеПоляРесурсов Цикл
		Если Не Стр.ВычисляемоеПоле И Не Стр.Числовое Тогда
			Продолжить;
		КонецЕсли;

		ДобавитьРесурс(Стр);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура УдалитьРесурс(Команда)
	ТекСтрокаРесурсов=Элементы.Ресурсы.ТекущаяСтрока;
	Если ТекСтрокаРесурсов = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Ресурсы.Удалить(Ресурсы.НайтиПоИдентификатору(ТекСтрокаРесурсов));
КонецПроцедуры

&НаКлиенте
Процедура УдалитьВсеРесурсы(Команда)
	Ресурсы.Очистить();
КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область НаборыДанных
&НаКлиенте
Функция НаборДанныхПоИмени(ИмяНабора, СтрокаНаборов = Неопределено)
	Если СтрокаНаборов = Неопределено Тогда
		СтрокаПоискаНаборов=НаборыДанных.НайтиПоИдентификатору(ИдентификаторНулевогоНабораДанных);
	Иначе
		СтрокаПоискаНаборов=СтрокаНаборов;
	КонецЕсли;

	НайденныйНабор=Неопределено;
	Для Каждого Стр Из СтрокаПоискаНаборов.ПолучитьЭлементы() Цикл
		Если НРег(Стр.Имя) = НРег(ИмяНабора) Тогда
			НайденныйНабор=Стр;
			Прервать;
		КонецЕсли;
	КонецЦикла;

	Возврат НайденныйНабор;
КонецФункции

&НаКлиенте
Процедура ЗаполнитьПоляНабораДанныхПриИзмененииЗапроса(ИдентификаторСтрокиНабора)
	ЗаполнитьПоляНабораДанныхПриИзмененииЗапросаНаСервере(ИдентификаторСтрокиНабора);
	ЗаполнитьВспомогательныеДанныеРесурсов();
КонецПроцедуры

&НаСервере
Процедура ДобавитьПолеНабора(СтрокаНабора, Колонка, ВидыПолейНаборовДанных, КолонкаРодитель = Неопределено)
	НовоеПоле=СтрокаНабора.Поля.Добавить();
	НовоеПоле.ТипЗначенияЗапроса=Колонка.ТипЗначения;
	Если КолонкаРодитель = Неопределено Тогда
		НовоеПоле.Поле=Колонка.Псевдоним;
		НовоеПоле.ПутьКДанным=Колонка.Псевдоним;
	Иначе
		НовоеПоле.Поле=КолонкаРодитель.Псевдоним + "." + Колонка.Псевдоним;
		НовоеПоле.ПутьКДанным=КолонкаРодитель.Псевдоним + "." + Колонка.Псевдоним;
	КонецЕсли;
	Если ТипЗнч(Колонка) = Тип("КолонкаВложеннаяТаблицаСхемыЗапроса") Тогда
		НовоеПоле.Вид=ВидыПолейНаборовДанных.Набор;
		НовоеПоле.Картинка=БиблиотекаКартинок.ВложеннаяТаблица;

		Для Каждого ТекКолонка Из Колонка.Колонки Цикл
			ДобавитьПолеНабора(СтрокаНабора, ТекКолонка, ВидыПолейНаборовДанных, Колонка);
		КонецЦикла;
	Иначе
		НовоеПоле.Вид=ВидыПолейНаборовДанных.Поле;
		НовоеПоле.Картинка=БиблиотекаКартинок.Реквизит;
	КонецЕсли;
КонецПроцедуры
&НаСервере
Процедура ЗаполнитьПоляНабораДанныхПриИзмененииЗапросаНаСервере(ИдентификаторСтрокиНабора)
	СтрокаНабора=НаборыДанных.НайтиПоИдентификатору(ИдентификаторСтрокиНабора);
	Если Не СтрокаНабора.АвтоЗаполнениеДоступныхПолей Тогда
		Возврат;
	КонецЕсли;

	ВидыПолейНаборовДанных=ВидыПолейНаборовДанных();

	СхемаЗапроса=Новый СхемаЗапроса;
	СхемаЗапроса.УстановитьТекстЗапроса(СтрокаНабора.Запрос);

	СтрокаНабора.Поля.Очистить();

	ИндексПакета=СхемаЗапроса.ПакетЗапросов.Количество() - 1;
	НужныйПакет=СхемаЗапроса.ПакетЗапросов[ИндексПакета];
	Пока ТипЗнч(НужныйПакет) <> Тип("ЗапросВыбораСхемыЗапроса") Цикл
		Если ИндексПакета < 0 Тогда
			Прервать;
		КонецЕсли;
		ИндексПакета=ИндексПакета - 1;
		НужныйПакет=СхемаЗапроса.ПакетЗапросов[ИндексПакета];
	КонецЦикла;

	Если ТипЗнч(НужныйПакет) <> Тип("ЗапросВыбораСхемыЗапроса") Тогда
		Возврат;
	КонецЕсли;

	Для Каждого Колонка Из НужныйПакет.Колонки Цикл
		ДобавитьПолеНабора(СтрокаНабора, Колонка, ВидыПолейНаборовДанных);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьКонструкторЗапросаЗавершение(Текст, ДополнительныеПараметры) Экспорт
	Если Текст = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ИдентификаторСтроки=ДополнительныеПараметры.ТекСтрока;
	СтрокаНабора=НаборыДанных.НайтиПоИдентификатору(ИдентификаторСтроки);

	СтрокаНабора.Запрос=Текст;

	ЗаполнитьПоляНабораДанныхПриИзмененииЗапроса(ИдентификаторСтроки);
КонецПроцедуры
&НаКлиенте
Процедура ДобавитьНаборДанных(Вид)
	ТекДанные=Элементы.НаборыДанных.ТекущиеДанные;
	Если ТекДанные.Вид = ВидыНаборовДанных.Объединение Тогда
		СтрокаДереваДляДобавления=НаборыДанных.НайтиПоИдентификатору(Элементы.НаборыДанных.ТекущаяСтрока);
	Иначе
		СтрокаДереваДляДобавления=НаборыДанных.НайтиПоИдентификатору(ИдентификаторНулевогоНабораДанных);
	КонецЕсли;

	НаборДанных=СтрокаДереваДляДобавления.ПолучитьЭлементы().Добавить();
	НаборДанных.Имя="НаборДанных" + НаборДанных.ПолучитьИдентификатор();
	НаборДанных.Вид=Вид;

	Если Вид = ВидыНаборовДанных.Запрос Тогда
		НаборДанных.Картинка=БиблиотекаКартинок.НоваяТаблицаКомпоновкиДанных;
		НаборДанных.АвтоЗаполнениеДоступныхПолей=Истина;
		НаборДанных.ИспользоватьГруппировкиЗапросаЕслиВозможно=Истина;
	ИначеЕсли Вид = ВидыНаборовДанных.Объект Тогда
		НаборДанных.Картинка=БиблиотекаКартинок.УИ_НаборДанныхСКДОбъект;
	ИначеЕсли Вид = ВидыНаборовДанных.Объединение Тогда
		НаборДанных.Картинка=БиблиотекаКартинок.УИ_НаборДанныхСКДОбъединение;
	КонецЕсли;

	Элементы.НаборыДанных.ТекущаяСтрока=СтрокаДереваДляДобавления.ПолучитьИдентификатор();

	Если ИсточникиДанных.Количество() > 0 Тогда
		НаборДанных.ИсточникДанных=ИсточникиДанных[0].Имя;
	КонецЕсли;
КонецПроцедуры
&НаКлиентеНаСервереБезКонтекста
Функция ВидыНаборовДанных()
	Структура=Новый Структура;
	Структура.Вставить("Корень", "Корень");
	Структура.Вставить("Запрос", "НаборДанныхЗапросСхемыКомпоновкиДанных");
	Структура.Вставить("Объект", "НаборДанныхОбъектСхемыКомпоновкиДанных");
	Структура.Вставить("Объединение", "НаборДанныхОбъединениеСхемыКомпоновкиДанных");

	Возврат Структура;
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция ВидыПолейНаборовДанных()
	Структура=Новый Структура;
	Структура.Вставить("Поле", "ПолеНабораДанныхСхемыКомпоновкиДанных");
	Структура.Вставить("Папка", "ПапкаПолейНабораДанныхСхемыКомпоновкиДанных");
	Структура.Вставить("Набор", "ВложенныйНаборДанныхСхемыКомпоновкиДанных");

	Возврат Структура;

КонецФункции
#КонецОбласти

#Область СвязиНаборовДанных
&НаКлиенте
Процедура ЗаполнитьСписокВыбораПоляСвязиНаборов(ИмяНабораДанных, ЭлементПоля)
	ЭлементПоля.СписокВыбора.Очистить();

	НаборДанных=НаборДанныхПоИмени(ИмяНабораДанных);
	Если НаборДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Для Каждого Поле Из НаборДанных.Поля Цикл
		ЭлементПоля.СписокВыбора.Добавить(Поле.ПутьКДанным);
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьВспомогательныеДанныеСвязейНаборовДанных()
	Наборы=НаборыДанныхВерхнегоУровня();

	Элементы.СвязиНаборовДанныхНаборДанныхИсточник.СписокВыбора.Очистить();
	Элементы.СвязиНаборовДанныхНаборДанныхПриемник.СписокВыбора.Очистить();

	Для Каждого Набор Из Наборы Цикл
		Элементы.СвязиНаборовДанныхНаборДанныхИсточник.СписокВыбора.Добавить(Набор.Имя);
		Элементы.СвязиНаборовДанныхНаборДанныхПриемник.СписокВыбора.Добавить(Набор.Имя);
	КонецЦикла;
КонецПроцедуры
#КонецОбласти

#Область ВычисляемыеПоля

#КонецОбласти

#Область Ресурсы
&НаКлиенте
Процедура РесурсыГруппировкиНачалоВыбораЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;

	СтрокаРесурса=Ресурсы.НайтиПоИдентификатору(ДополнительныеПараметры.ИдентификаторСтроки);
	СтрокаРесурса.Группировки=Результат;
КонецПроцедуры

&НаКлиенте
Процедура РесурсыВыражениеОткрытиеЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;

	СтрокаРесурса=Ресурсы.НайтиПоИдентификатору(ДополнительныеПараметры.ИдентификаторСтроки);
	СтрокаРесурса.Выражение=Результат;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьРесурс(СтрокаДоступногоПоля)
	Если ТипЗнч(СтрокаДоступногоПоля) = Тип("Число") Тогда
		ДоступноеПоле=ДоступныеПоляРесурсов.НайтиПоИдентификатору(СтрокаДоступногоПоля);
	Иначе
		ДоступноеПоле=СтрокаДоступногоПоля;
	КонецЕсли;

	НС=Ресурсы.Добавить();
	НС.ПутьКДанным=ДоступноеПоле.ПутьКДанным;

	Если ДоступноеПоле.ВычисляемоеПоле Или ДоступноеПоле.Числовое Тогда
		НС.Выражение=СтрШаблон("Сумма(%1)", НС.ПутьКДанным);
	Иначе
		НС.Выражение=СтрШаблон("Количество(%1)", НС.ПутьКДанным);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьДоступныеПоляРесурсов()
	ДоступныеПоляРесурсов.Очистить();

	НаборыДанныхВерхнегоУровня=НаборыДанныхВерхнегоУровня();

	КартинкаРеквизит=БиблиотекаКартинок.Реквизит;
	КартинкаПроизвольноеВыражение=БиблиотекаКартинок.ПроизвольноеВыражение;

	МассивПутей=Новый Массив;

	Для Каждого Набор Из НаборыДанныхВерхнегоУровня Цикл
		Для Каждого Поле Из Набор.Поля Цикл
			Если МассивПутей.Найти(Поле.ПутьКДанным) <> Неопределено Тогда
				Продолжить;
			КонецЕсли;

			Если Поле.Вид <> ВидыПолейНаборовДанных.Поле Тогда
				Продолжить;
			КонецЕсли;

			НС=ДоступныеПоляРесурсов.Добавить();
			НС.ПутьКДанным=Поле.ПутьКДанным;
			НС.Картинка=КартинкаРеквизит;

			НС.Числовое= Поле.ТипЗначенияЗапроса.СодержитТип(тип("Число"));

			МассивПутей.Добавить(Поле.ПутьКДанным);
		КонецЦикла;
	КонецЦикла;

	Для Каждого Поле Из ВычисляемыеПоля Цикл
		Если МассивПутей.Найти(Поле.ПутьКДанным) <> Неопределено Тогда
			Продолжить;
		КонецЕсли;
		НС=ДоступныеПоляРесурсов.Добавить();
		НС.ПутьКДанным=Поле.ПутьКДанным;
		НС.ВычисляемоеПоле=Истина;
		НС.Картинка=КартинкаПроизвольноеВыражение;

		МассивПутей.Добавить(Поле.ПутьКДанным);

	КонецЦикла;

	ДоступныеПоляРесурсов.Сортировать("ПутьКДанным Возр");
КонецПроцедуры

&НаКлиенте
Процедура УдалитьРесурсыНеПодходящиеПоДоступнымПолям()
	МассивУдаляемыхСтрок=Новый Массив;
	Для Каждого Стр Из Ресурсы Цикл
		СтруктураПоиска=Новый Структура;
		СтруктураПоиска.Вставить("ПутьКДанным", Стр.ПутьКДанным);

		НайденныеСтроки=ДоступныеПоляРесурсов.НайтиСтроки(СтруктураПоиска);
		Если НайденныеСтроки.Количество() = 0 Тогда
			МассивУдаляемыхСтрок.Добавить(стр);
		КонецЕсли;
	КонецЦикла;

	Для Каждого Стр Из МассивУдаляемыхСтрок Цикл
		Ресурсы.Удалить(Стр);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьВспомогательныеДанныеРесурсов()
	ЗаполнитьДоступныеПоляРесурсов();
	УдалитьРесурсыНеПодходящиеПоДоступнымПолям();
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСписокВыбораВыраженияРесурса(ИдентификаторСтрокиРесурса)
	Элементы.РесурсыВыражение.СписокВыбора.Очистить();

	СтрокаРесурса=Ресурсы.НайтиПоИдентификатору(ИдентификаторСтрокиРесурса);

	СтруктураПоиска=Новый Структура;
	СтруктураПоиска.Вставить("ПутьКДанным", СтрокаРесурса.ПутьКДанным);

	СтрокиДоступныхПолей=ДоступныеПоляРесурсов.НайтиСтроки(СтруктураПоиска);
	Если СтрокиДоступныхПолей.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	СтрокаДоступногоПоля=СтрокиДоступныхПолей[0];

	Если СтрокаДоступногоПоля.ВычисляемоеПоле Или СтрокаДоступногоПоля.Числовое Тогда
		Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Сумма(%1)", СтрокаРесурса.ПутьКДанным));
		Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Среднее(%1)", СтрокаРесурса.ПутьКДанным));
	КонецЕсли;
	Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Максимум(%1)", СтрокаРесурса.ПутьКДанным));
	Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Минимум(%1)", СтрокаРесурса.ПутьКДанным));
	Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Количество(%1)", СтрокаРесурса.ПутьКДанным));
	Элементы.РесурсыВыражение.СписокВыбора.Добавить(СтрШаблон("Количество(Различные %1)", СтрокаРесурса.ПутьКДанным));

КонецПроцедуры
#КонецОбласти

&НаСервере
Процедура ИнициализироватьФорму()
	ВидыНаборов=ВидыНаборовДанных();

	ЛокальныйИсточникДанных=ИсточникиДанных.Добавить();
	ЛокальныйИсточникДанных.Имя="ИсточникДанных1";
	ЛокальныйИсточникДанных.ТипИсточникаДанных="Local";

	НулевойНаборДанных=НаборыДанных.ПолучитьЭлементы().Добавить();
	НулевойНаборДанных.Имя="Наборы данных";
	НулевойНаборДанных.Вид=ВидыНаборов.Корень;

	ИдентификаторНулевогоНабораДанных=НулевойНаборДанных.ПолучитьИдентификатор();
КонецПроцедуры

&НаКлиенте
Функция НаборыДанныхВерхнегоУровня()
	МассивНаборов=Новый Массив;

	НулевойНаборДанных=НаборыДанных.НайтиПоИдентификатору(ИдентификаторНулевогоНабораДанных);
	Для Каждого Набор Из НулевойНаборДанных.ПолучитьЭлементы() Цикл
		МассивНаборов.Добавить(Набор);
	КонецЦикла;

	Возврат МассивНаборов;
КонецФункции

&НаКлиенте
Процедура ЗаполнитьСписокВыбораИсточникаДанныхНабора()
	Элементы.НаборыДанныхИсточникДанных.СписокВыбора.Очистить();

	Для Каждого Стр Из ИсточникиДанных Цикл
		Элементы.НаборыДанныхИсточникДанных.СписокВыбора.Добавить(Стр.Имя);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ГруппаНаборыДанныхПраваяПанельПриСменеСтраницы(Элемент, ТекущаяСтраница)
	ЗаполнитьСписокВыбораИсточникаДанныхНабора();
КонецПроцедуры
#КонецОбласти

ВидыНаборовДанных=ВидыНаборовДанных();
ВидыПолейНаборовДанных=ВидыПолейНаборовДанных();