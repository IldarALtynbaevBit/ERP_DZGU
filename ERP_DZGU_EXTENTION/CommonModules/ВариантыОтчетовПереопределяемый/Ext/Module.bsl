﻿
&Перед("ОпределитьОбъектыСКомандамиОтчетов")
Процедура Расш1_ОпределитьОбъектыСКомандамиОтчетов(Объекты)
	Объекты.Добавить(Метаданные.Документы.БИТ_ЗаявкаНаСертификацию);
	Объекты.Добавить(Метаданные.Документы.БИТ_СертификацияНоменклатуры);
	Объекты.Добавить(Метаданные.Документы.БИТ_АктПодбораПробНоменклатуры);
	Объекты.Добавить(Метаданные.Документы.БИТ_УдостоверениеКачества);
	Объекты.Добавить(Метаданные.Документы.ДанныеДляРасчетаЗарплаты);
КонецПроцедуры
