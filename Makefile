PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1
TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = Tweakio

include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e

APPLICATION_NAME = Tweakio

$(APPLICATION_NAME)_FILES = $(wildcard *.m)
$(APPLICATION_NAME)_FRAMEWORKS = UIKit CoreGraphics
$(APPLICATION_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
