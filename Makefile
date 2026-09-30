TARGET := iphone:clang:latest:13.0
ARCHS = arm64 arm64e
GO_EASY_ON_ME = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

# Rootless (Dopamine, iOS 15/16, palera1n):
#   make package ROOTLESS=1 FINALPACKAGE=1
# Rootful (unc0ver/checkra1n/Taurine, iOS 12-14):
#   make package FINALPACKAGE=1
ifeq ($(ROOTLESS), 1)
	export THEOS_PACKAGE_SCHEME = rootless
endif

# Theos uses the newest SDK it can find (the Xcode SDK on macOS, or whatever is
# in $(THEOS)/sdks). Uncomment and adjust to pin a specific one.
# TARGET := iphone:clang:16.5:13.0

INSTALL_TARGET_PROCESSES = Tweakio

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Tweakio

$(APPLICATION_NAME)_FILES = $(wildcard *.m)
$(APPLICATION_NAME)_FRAMEWORKS = UIKit CoreGraphics
$(APPLICATION_NAME)_CFLAGS = -fobjc-arc
# Applications default to /Applications; the theos rootless scheme moves that to
# /var/jb/Applications, which is where uicache looks on those jailbreaks.

include $(THEOS_MAKE_PATH)/application.mk
