#ifndef __CALLBACKS_HELPER_H_ //
#define __CALLBACKS_HELPER_H_
// Header code
//
#define EIFFEL_CALLBACK_TYPEDEF(name,result_type,signature) typedef result_type (*callback_##name##_eiffel_feature) (void* a_class, signature);

#define CALLBACK_STRUCT(name) typedef struct name##_clbk_array_entry\
{\
	void * a_stub;\
	void* a_class;\
	callback_##name##_eiffel_feature a_feature;\
} name##_clbk_array_entry;

#define CALLBACK_PROTOTYPE_NEW(name) int new_##name##_clbk_entry (void* a_class, void* a_feature);
#define CALLBACK_PROTOTYPE_FREE(name) void free_##name##_clbk_entry (int index);
#define CALLBACK_PROTOTYPE_GET_STUB(name) void* get_##name##_clbk_stub (int index);
#define CALLBACK_PROTOTYPE_CALL(name,result_type,signature) result_type call_clbk_##name## (void* a_function, signature);
#define CALLBACK_ENTRIES_FORWARD(name) extern name##_clbk_array_entry name##_clbk_entries[];
//
// C code
//
#define CALLBACK_STUB_ADDRESS(name,index) (void*) name##_clbk_stub_##index
#define CALLBACK_ENTRIES(name) static name##_clbk_array_entry name##_clbk_entries [31] = {\
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

#define CALLBACK_DUMMY_RESULT_VALUE(name,result_type) result_type name##_clbk_dummy_return_value;

#define CALLBACK_STUBS(name,result_type,call_type,signature,realparameters) \
CALLBACK_STUB(name,0,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,1,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,2,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,3,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,4,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,5,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,6,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,7,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,8,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,9,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,10,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,11,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,12,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,13,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,14,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,15,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,16,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,17,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,18,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,19,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,20,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,21,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,22,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,23,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,24,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,25,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,26,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,27,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,28,result_type,call_type,signature,realparameters)\
CALLBACK_STUB(name,29,result_type,call_type,signature,realparameters)

#define CALLBACK_STUB(name,index,result_type,call_type,signature,realparameters) result_type call_type name##_clbk_stub_##index (signature)\
{\
	if (name##_clbk_entries[index].a_class != NULL && name##_clbk_entries[index].a_feature != NULL)\
	{\
		return (name##_clbk_entries[index].a_feature) (eif_access(name##_clbk_entries[index].a_class), realparameters);\
	}\
	return name##_clbk_dummy_return_value;\
}

#define CALLBACK_NEW(name) int new_##name##_clbk_entry (void* a_class, void* a_feature)\
{\
	int i;\
	for (i=0; name##_clbk_entries[i].a_stub != NULL && name##_clbk_entries[i].a_class != NULL; i++);\
	if (name##_clbk_entries[i].a_stub != NULL) {\
		name##_clbk_entries[i].a_class = eif_adopt(a_class);\
		name##_clbk_entries[i].a_feature = (callback_##name##_eiffel_feature) a_feature;\
		return i;\
	} else return -1;\
}

#define CALLBACK_FREE(name) void free_##name##_clbk_entry(int index) { name##_clbk_entries[index].a_class=NULL; name##_clbk_entries[index].a_feature=NULL;}

#define CALLBACK_GET_STUB(name) void* get_##name##_clbk_stub (int index)\
{\
	return (void*) name##_clbk_entries[index].a_stub;\
}

#define CALLBACK_CALL(name,result_type,call_type,signature,real_parameters) result_type call_clbk_##name (void* a_function, signature)\
{\
	return ((result_type (call_type*)(signature)) a_function)(real_parameters);\
}

#endif

