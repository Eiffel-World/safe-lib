//
// Header code
//
#define EIFFEL_CALLBACK_TYPEDEF(name,result_type,signature) typedef ##result_type (*##name_eiffel_feature) (void* a_class, ##signature);
#define CALLBACK_STRUCT(name) struct ##name_entry_struct\
{\
	void * a_stub;\
	void* a_class;\
	##name_eiffel_feature feature;\
};

#define CALLBACK_PROTOTYPE_NEW(name) int new_##name_entry (void* a_class, void* a_feature);
#define CALLBACK_PROTOTYPE_GET_STUB(name) void* get_##name_stub (int index);
#define CALLBACK_PROTOTYPE_CALL(name,result_type,signature) ##result_type call_##name (void* a_function, ##signature);

//
// C code
//
#define CALLBACK_STUB_ADDRESS(name,index) (void*) ##name_stub_##index
#define CALLBACK_ENTRIES(name) struct ##name_entry_struct ##name_entry [31] = {\
	{CALLBACK_STUB_ADDRESS(name,0), NULL, NULL}, {CALLBACK_STUB_ADDRESS(name,1), NULL, NULL}, {CALLBACK_STUB_ADDRESS(name,2), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,3), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,4), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,5), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,6), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,7), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,8), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,9), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,10), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,11), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,12), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,13), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,14), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,15), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,16), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,17), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,18), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,19), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,20), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,21), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,22), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,23), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,24), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,25), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,26), NULL, NULL},\
	{CALLBACK_STUB_ADDRESS(name,27), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,28), NULL, NULL},{CALLBACK_STUB_ADDRESS(name,29), NULL, NULL},\
	{NULL, NULL, NULL}\
};

#define CALLBACK_DUMMY_RESULT_VALUE(name,result_type) ##result_type ##name_dummy_return_value;

#define CALLBACK_STUB(name,index,result_type,call_type,signature,real_parameters) result_type call_type ##name_stub_##index (##signature)\
{\
	if (##name_entry[##index].a_class != NULL && ##name_entry[##index].feature != NULL)\
	{\
		return #name_entry[##index].feature (eif_access(##name_entry[##index].a_class), ##realparameters);\
	}\
	return ##name_dummy_return_value;\
}

#define CALLBACK_NEW(name) int new_##name_entry (int index, void* a_class, void* a_feature)\
{\
	int i;
	for (i=0; ##name_entry[i].a_stub != NULL && ##name_entry[i].a_class != NULL, i++);
	if (##name_entry[i].a_stub != NULL) {
		##name_entry[index].a_class = eif_adopt(a_class);\
		##name_entry[index].feature = (CALLBACKNAME_eiffel_feature) a_feature;\
		return i;
	} else return -1;
}

#define CALLBACK_FREE(name) void free_##name_entry(int index) { ##name_entry[index].a_class=NULL; ##name_entry[index].a_feature=NULL;}

#define CALLBACK_GET_STUB(name) void* get_##name_stub (int index)\
{\
	return (void*) ##name_entry[index].a_stub;\
}

#define CALLBACK_CALL(name,result_type,signature,real_parameters) ##result_type call_##name (int index, void* a_function, #signature)\
{\
	return ((##result_type (*)(##signature))##name_entry[index].a_stub)(##real_parameters);\
}
