#include <windows.h>

LOGFONT * ewg_struct_NONCLIENTMETRICSA_member_get_lfCaptionFont(struct tagNONCLIENTMETRICSA * a_item) {
	return (LOGFONT * ) &(((struct tagNONCLIENTMETRICSA * )a_item)->lfCaptionFont);
}

LOGFONT * ewg_struct_NONCLIENTMETRICSA_member_get_lfSmCaptionFont(struct tagNONCLIENTMETRICSA * a_item) {
	return (LOGFONT * )  &(((struct tagNONCLIENTMETRICSA * )a_item)->lfSmCaptionFont);
}

LOGFONT * ewg_struct_NONCLIENTMETRICSA_member_get_lfMenuFont(struct tagNONCLIENTMETRICSA * a_item) {
	return (LOGFONT * )  &(((struct tagNONCLIENTMETRICSA * )a_item)->lfMenuFont);
}

LOGFONT * ewg_struct_NONCLIENTMETRICSA_member_get_lfStatusFont(struct tagNONCLIENTMETRICSA * a_item) {
	return (LOGFONT * )  &(((struct tagNONCLIENTMETRICSA * )a_item)->lfStatusFont);
}

LOGFONT * ewg_struct_NONCLIENTMETRICSA_member_get_lfMessageFont(struct tagNONCLIENTMETRICSA * a_item) {
	return (LOGFONT * )  &(((struct tagNONCLIENTMETRICSA * )a_item)->lfMessageFont);
}

