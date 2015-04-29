LOCAL_PATH := $(call my-dir)/../../../src
include $(CLEAR_VARS)
src = utils.c mjpg_streamer.c
input_file= plugins/input_file/input_file.c
input_gspcav1= plugins/input_gspcav1/encoder.c plugins/input_gspcav1/huffman.c plugins/input_gspcav1/marker.c plugins/input_gspcav1/quant.c plugins/input_gspcav1/spcav4l.c plugins/input_gspcav1/utils.c plugins/input_gspcav1/input_gspcav1.c
input_testpicture = plugins/input_testpicture/input_testpicture.c
input_uvc = plugins/input_uvc/dynctrl.c  plugins/input_uvc/input_uvc.c plugins/input_uvc/jpeg_utils.c plugins/input_uvc/v4l2uvc.c
output_file =plugins/output_file/output_file.c
output_http =plugins/output_http/httpd.c  plugins/output_http/output_http.c
output_autofocus =plugins/output_autofocus/output_autofocus.c plugins/output_autofocus/processJPEG_onlyCenter.c
LOCAL_MODULE := mjpeg
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -O3 -DANDROID_NDK -DDLL_EXPORT -DTINYXML2_EXPORT
LOCAL_SRC_FILES := $(src) $(input_file) $(input_gspcav1) $(input_testpicture) $(input_uvc) $(output_file) $(output_http) $(output_autofocus)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include  $(LOCAL_PATH)/plugins/input_gspcav1 $(LOCAL_PATH)/plugins/input_file
LOCAL_LDLIBS += -L$(LOCAL_PATH)/../build/android/lib 
LOCAL_LDLIBS += -ldl -llog -lgcc
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/../include
include $(BUILD_STATIC_LIBRARY)


