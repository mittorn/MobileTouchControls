#############################
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := touchcontrols

LOCAL_CFLAGS := -DANDROID_NDK

include $(XASH3D_CONFIG)

LOCAL_C_INCLUDES := $(LOCAL_PATH)


LOCAL_SRC_FILES:= \
 	TouchControls.cpp \
 	ControlSuper.cpp \
 	RectF.cpp \
 	Button.cpp \
 	OpenGLUtils.cpp \
 	GLRect.cpp \
 	TouchJoy.cpp \
 	Mouse.cpp \
 	PolarSelect.cpp \
 	MultitouchMouse.cpp \
 	WheelSelect.cpp \
 	TouchControlsContainer.cpp \
 	GLLines.cpp \
 	JNITouchControlsUtils.cpp \
 	
LOCAL_LDLIBS := -lGLESv1_CM -ldl -llog
LOCAL_STATIC_LIBRARIES := sigc libzip libpng tinyxml 

include $(BUILD_SHARED_LIBRARY)


ifeq ($(BUILD_GLES2_TC),1)

TC_LOCAL_SRC_FILES := $(LOCAL_SRC_FILES)
#Now also build gles2 version

include $(CLEAR_VARS)

LOCAL_MODULE := touchcontrols_gles2

LOCAL_CFLAGS += -Werror -DANDROID_NDK -DUSE_GLES2

include $(XASH3D_CONFIG)

LOCAL_C_INCLUDES := $(LOCAL_PATH) $(IDTECH_DIR)  $(IDTECH_DIR)/libpng $(IDTECH_DIR)/TinyXML

LOCAL_SRC_FILES:= $(TC_LOCAL_SRC_FILES)

LOCAL_LDLIBS := -lGLESv2 -ldl -llog
LOCAL_STATIC_LIBRARIES := sigc libzip libpng tinyxml

include $(BUILD_SHARED_LIBRARY)

endif
