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

POINT * ewg_struct_WINDOWPLACEMENT_member_get_ptMinPosition (struct tagWINDOWPLACEMENT * a_item) {
	return (POINT *) &(a_item->ptMinPosition);
}

POINT * ewg_struct_WINDOWPLACEMENT_member_get_ptMaxPosition (struct tagWINDOWPLACEMENT * a_item) {
	return (POINT *) &(a_item->ptMaxPosition);
}

RECT * ewg_struct_WINDOWPLACEMENT_member_get_rcNormalPosition (struct tagWINDOWPLACEMENT * a_item) {
	return (RECT *) &(a_item->rcNormalPosition);
}

RECT * ewg_struct_PAINTSTRUCT_member_get_rcPAINT (struct tagPAINTSTRUCT * a_item) {
	return (RECT *) &(a_item->rcPaint);
}
