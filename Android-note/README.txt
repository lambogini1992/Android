*****Driver****
	- location: kernel/msm-4.9/drivers/fih
		add new file: fih_btn_test.c
		modify fih/Makefile:
				obj-y += fih_btn_test.o

*****HAL*****

        -       location: android_build/hardware/libhardware/include/hardware/
                        add new file: voldown.h
        -       location: hardware/libhardware/modules/voldown
                        folder "voldown" contain: voldown.c, Android.bp
                        build:
                                -       location : device/fih_qcom/fih_sdm429_64/device.mk

                                        PRODUCT_PACKAGES += voldown.default
					PRODUCT_PACKAGES += voldown_tests
        -       modify Android.mk in hardware/libhardware/module
				hardware_modules := \
						    camera \
 						    gralloc \
    						    voldown 
                                               
Note: Defined module ID in header file should be same as the name of the file
Ex: file name: voldown.c
Should be defined: #define VOL_HARDWARE_MODULE_ID          "voldown"

*****JNI*****

location: android_build/frameworks/base/services/core/jni/
add new file: com_android_server_VolbtnService.cpp
add line in onload.cpp:
        - int register_android_server_VolbtnService(JNIEnv *env);
        - register_android_server_VolbtnService(env);
add line in Android.bp
	"com_android_server_VolbtnService.cpp",
 
 *****Framework*****

- Add new file: VolbtnManager.java
	location:frameworks\base\core\java\android\os\VolbtnManager.java
- Add line in Context.java
	location: frameworks\base\core\java\android\content\Context.java
- Add new file: IVolbtnService.aidl
	location: frameworks\base\core\java\android\os\IVolbtnService.aidl
- Add line in Android.bp
	location:frameworks/base/Android.bp
- Add new file: VolbtnService.java
	location: frameworks\base\services\core\java\com\android\server\VolbtnService.java
- Add line in SystemServer.java
	location: frameworks\base\services\java\com\android\server\SystemServer.java
- Add line in SystemServiceRegistry.java
	location: frameworks\base\core\java\android\app\SystemServiceRegistry.java

