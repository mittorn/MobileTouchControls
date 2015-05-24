
LOCAL_PATH := $(call my-dir)/../

include $(CLEAR_VARS)
LOCAL_MODULE    := sigc

LOCAL_CPPFLAGS :=    -fexceptions 

LOCAL_CFLAGS += $(CFLAGS_OPT)
ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS += $(CFLAGS_OPT_ARM)
endif
ifeq ($(TARGET_ARCH),x86)
LOCAL_CFLAGS += $(CFLAGS_OPT_X86)
endif


LOCAL_C_INCLUDES := $(LOCAL_PATH) 

LOCAL_SRC_FILES := sigc++/connection.cpp sigc++/signal.cpp sigc++/signal_base.cpp sigc++/trackable.cpp  sigc++/functors/slot_base.cpp

LOCAL_LDLIBS := -llog
include $(BUILD_STATIC_LIBRARY)



