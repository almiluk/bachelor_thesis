EEPROMVar<uint16_t> int_var("int_var", 1);

int_var = int_var + 1;

int_var.UpdateNow();

EEPROMVar<UserClass> custom_data("custom_data", UserClass());

custom_data.Data().UpdateField();

custom_data.Update();

custom_data = custom_data.Data().UpdateField();
