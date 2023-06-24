struct data
{
	char array[512] = {0};
};

EEPROMVar<data> var("array", data());

if (!var.Ok())
{
	// Обработка ситуации, когда массив выходит за пределы EEPROM.
}

var.Data()[10] = 100;

var.UpdateNow();
