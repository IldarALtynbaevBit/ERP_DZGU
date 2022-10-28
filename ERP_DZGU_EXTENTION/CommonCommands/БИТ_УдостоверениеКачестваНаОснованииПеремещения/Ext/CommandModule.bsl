﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	Если ОбщегоНазначенияУТВызовСервера.ЗначениеРеквизитаОбъекта(ПараметрКоманды,"Статус") = ПредопределенноеЗначение("Перечисление.СтатусыПеремещенийТоваров.Принято") Тогда 
		МассивСертификаций = ЗаполнитьСертификациюСрв(ПараметрКоманды);	
		Для каждого стр из МассивСертификаций Цикл 
			ПараметрыФормы = Новый Структура("Основание", стр);
			ОткрытьФорму("Документ.БИТ_УдостоверениеКачества.Форма.ФормаДокумента",ПараметрыФормы);
		КонецЦикла;
	Иначе
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю("Статус документа отличается от ""Завершен""");
	КонецЕсли;
КонецПроцедуры
&НаСервере
Функция ЗаполнитьСертификациюСрв(Ссылка)
    МассивСертификаций = Новый Массив;
    Для каждого стр из Ссылка.Товары Цикл
        //ПараметрыОтбораДС = Новый Структура;
        //ПараметрыОтбораДС.Вставить("Свойство", ПланыВидовХарактеристик.ДополнительныеРеквизитыИСведения.НайтиПоРеквизиту("Имя","БИТ_ТребуетсяВнутренняяСертификация"));
        //Если стр.Номенклатура.ДополнительныеРеквизиты.НайтиСтроки(ПараметрыОтбораДС).Количество() = 1 Тогда 
        //	Если стр.Номенклатура.ДополнительныеРеквизиты[0].Значение.Наименование = "Требуется"	 Тогда
        Если стр.Номенклатура.БИТ_ТребуетсяВнутренняяСертификация Тогда
            ДокСертификация = Документы.БИТ_СертификацияНоменклатуры.СоздатьДокумент();
            СтруктураЗаполнения = Новый Структура;
            СтруктураЗаполнения.Вставить("Ссылка",Ссылка);
            СтруктураЗаполнения.Вставить("Номенклатура",стр.Номенклатура);
            СтруктураЗаполнения.Вставить("Серия",стр.Серия);
            
            
            Если ТипЗнч(Ссылка) = Тип("ДокументСсылка.ПеремещениеТоваров") Тогда
                СтруктураЗаполнения.Вставить("Склад",Ссылка.СкладОтправитель);
            ИначеЕсли  ТипЗнч(Ссылка) = Тип("ДокументСсылка.ЭтапПроизводства2_2") Тогда
                СтруктураЗаполнения.Вставить("Склад",стр.Получатель);
            КонецЕсли;		
            МассивСертификаций.Добавить(СтруктураЗаполнения);
            
        КонецЕсли;
    КонецЦикла;
    Возврат МассивСертификаций;
КонецФункции

