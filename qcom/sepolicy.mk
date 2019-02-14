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
    device/pa/sepolicy/qcom/dynamic
else
BOARD_SEPOLICY_DIRS += \
    device/pa/sepolicy/qcom/dynamic \
    device/pa/sepolicy/qcom/vendor
endif
