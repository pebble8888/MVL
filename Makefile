all:

uninstall:
	rm -rf "$(HOME)/Library/Application Support/Developer/Shared/Xcode/Plug-ins/MVL.xcplugin"

uuid:
	@xcode_path=`xcode-select -p`; \
	uuid=`defaults read "$${xcode_path}/../Info" DVTPlugInCompatibilityUUID`; \
	xcode_version=`defaults read "$${xcode_path}/../Info" CFBundleShortVersionString`; \
	grep $${uuid} MVL/Info.plist > /dev/null ; \
	if [ $$? -ne 0 ]; then \
	    plutil -insert DVTPlugInCompatibilityUUIDs.0 -string $${uuid} MVL/Info.plist; \
	fi; \

