# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk
include $(ADK_TOPDIR)/mk/kernel-build.mk
include $(ADK_TOPDIR)/mk/image.mk

KERNEL:=$(LINUX_DIR)/vmlinux
OSTRIP:=-R .reginfo -R .notes -R .note -R .comment -R .mdebug -R .note.gnu.build-id

QEMU_ARGS:=${ADK_QEMU_ARGS}
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_MACPPC),y)
QEMU_ARGS+=-M mac99
QEMU_ARGS+=-device e1000,netdev=adk0 -netdev user,id=adk0
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_VIRTEX_ML507),y)
QEMU_ARGS+=-M virtex-ml507 -m 256 -dtb $(FW_DIR)/ppc.dtb
endif
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_BAMBOO),y)
QEMU_ARGS+=-M bamboo
QEMU_ARGS+=-device e1000,netdev=adk0 -netdev user,id=adk0
endif

# target helper text
ifeq ($(ADK_TARGET_FS),archive)
targethelp:
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSTARBALL)"
ifeq ($(ADK_TARGET_QEMU),y)
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "Use following command to create a QEMU Image:"
	@echo "./scripts/create.sh qemu-${ADK_TARGET_CPU_ARCH}.img $(FW_DIR)/$(ROOTFSTARBALL)"
	@echo "Start qemu with following options:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) qemu-${ADK_TARGET_CPU_ARCH}.img'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo 'The initramfs image is: ${FW_DIR}/${INITRAMFS}'
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL) -initrd ${FW_DIR}/${INITRAMFS}'
endif
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif
ifeq ($(ADK_TARGET_FS),initramfspiggyback)
targethelp:
	@echo 'The kernel+initramfs file is: $(FW_DIR)/${TARGET_KERNEL}'
ifeq ($(ADK_TARGET_QEMU),y)
	@echo "Start qemu with following command line:"
	@echo 'qemu-system-${ADK_TARGET_CPU_ARCH} ${QEMU_ARGS} -kernel $(FW_DIR)/$(TARGET_KERNEL)'
endif
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
targethelp:
	@echo 'The kernel file is: $(FW_DIR)/${TARGET_KERNEL}'
	@echo "The RootFS tarball is: $(FW_DIR)/$(ROOTFSUSERTARBALL)"
endif

# image creation and kernel install
kernel-strip:
	$(TARGET_CROSS)objcopy $(OSTRIP) -S $(KERNEL) $(BUILD_DIR)/$(TARGET_KERNEL)

kernel-install: kernel-strip
	@cp $(BUILD_DIR)/$(TARGET_KERNEL) $(FW_DIR)/${TARGET_KERNEL}

dtb-install:
	env $(KERNEL_MAKE_ENV) $(MAKE) -C "${LINUX_DIR}" $(KERNEL_MAKE_OPTS) \
		-j${ADK_MAKE_JOBS} virtex440-ml507.dtb $(MAKE_TRACE)
	$(CP) $(LINUX_DIR)/arch/powerpc/boot/virtex440-ml507.dtb \
		$(FW_DIR)/ppc.dtb

# filesystem specific targets
ifeq ($(ADK_TARGET_FS),archive)
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_VIRTEX_ML507),y)
imageinstall: dtb-install $(FW_DIR)/$(ROOTFSTARBALL) targethelp
else
imageinstall: $(FW_DIR)/$(ROOTFSTARBALL) targethelp
endif
endif
ifeq ($(ADK_TARGET_FS),initramfs)
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_VIRTEX_ML507),y)
imageinstall: dtb-install kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
else
imageinstall: kernel-install $(FW_DIR)/$(INITRAMFS) targethelp
endif
endif
ifeq ($(ADK_TARGET_FS),initramfsarchive)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
ifeq ($(ADK_TARGET_FS),initramfspiggyback)
ifeq ($(ADK_TARGET_SYSTEM_QEMU_PPC_VIRTEX_ML507),y)
imageinstall: dtb-install createinitramfs targethelp
else
imageinstall: createinitramfs targethelp
endif
endif
ifeq ($(ADK_TARGET_FS),nfsroot)
imageinstall: kernel-install $(FW_DIR)/$(ROOTFSUSERTARBALL) targethelp
endif
