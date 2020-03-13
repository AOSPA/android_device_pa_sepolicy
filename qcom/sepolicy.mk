#
# This policy configuration will be used by all qcom products
# that inherit from PA
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/pa/sepolicy/qcom/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/pa/sepolicy/qcom/system-only
ifeq ($(call is-board-platform-in-list, msm8909 msm8937 msm8953 msm8996 msm8998 sdm660 apq8084 msm8226 msm8909 msm8916 msm8952 msm8960 msm8974 msm8976 msm8992 msm8994),true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/pa/sepolicy/qcom/dynamic-legacy-um
else
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/pa/sepolicy/qcom/dynamic
endif
else
BOARD_SEPOLICY_DIRS += \
    device/pa/sepolicy/qcom/vendor
ifeq ($(call is-board-platform-in-list, msm8909 msm8937 msm8953 msm8996 msm8998 sdm660 apq8084 msm8226 msm8909 msm8916 msm8952 msm8960 msm8974 msm8976 msm8992 msm8994),true)
BOARD_SEPOLICY_DIRS += \
    device/pa/sepolicy/qcom/dynamic-legacy-um
else
BOARD_SEPOLICY_DIRS += \
    device/pa/sepolicy/qcom/dynamic
endif
endif
