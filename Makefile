export TARGET=iphone:clang
export THEOS_DEVICE_IP=192.168.1.90

include theos/makefiles/common.mk

TWEAK_NAME = OpenOnSearch
OpenOnSearch_FILES = Tweak.xm

THEOS_BUILD_DIR = debs

include $(THEOS_MAKE_PATH)/tweak.mk
