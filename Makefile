RELEASE_FOLDER=./dist
BUILD_FOLDER=./build
INSTALL_FOLDER=../Plugins

SD_DICE=com.viddie.dice
SD_COUNTER=com.viddie.counter

TARGET=none

install_sdDice: TARGET=$(SD_DICE)
install_sdDice: install_all
	
build_sdDice: TARGET=$(SD_DICE)
build_sdDice: build_all
	
clean_sdDice: TARGET=$(SD_DICE)
clean_sdDice: clean_all
	
	
	
install_sdCounter: TARGET=$(SD_COUNTER)
install_sdCounter: install_all
	
build_sdCounter: TARGET=$(SD_COUNTER)
build_sdCounter: build_all
	
clean_sdCounter: TARGET=$(SD_COUNTER)
clean_sdCounter: clean_all
	
	
	
	
	
install_all: build_all
	cp -r $(BUILD_FOLDER)/$(TARGET).sdPlugin $(INSTALL_FOLDER)/$(TARGET).sdPlugin
	
build_all: clean_all
	mkdir -p $(RELEASE_FOLDER)
	mkdir -p $(BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)/$(TARGET).sdPlugin
	cp $(TARGET).sdPlugin/manifest.json $(BUILD_FOLDER)/$(TARGET).sdPlugin/manifest.json
	cp $(TARGET).sdPlugin/index.html $(BUILD_FOLDER)/$(TARGET).sdPlugin/index.html
	cp -r $(TARGET).sdPlugin/js $(BUILD_FOLDER)/$(TARGET).sdPlugin/
	cp -r $(TARGET).sdPlugin/propertyinspector $(BUILD_FOLDER)/$(TARGET).sdPlugin/
	cp -r $(TARGET).sdPlugin/images $(BUILD_FOLDER)/$(TARGET).sdPlugin/
	DistributionTool -b -i $(BUILD_FOLDER)/$(TARGET).sdPlugin -o $(RELEASE_FOLDER)
	
clean_all:
	rm -rf $(BUILD_FOLDER)/$(TARGET).sdPlugin $(RELEASE_FOLDER)/$(TARGET).streamDeckPlugin
	
	
	
clean: clean_sdDice
	rm -rf $(RELEASE_FOLDER) $(BUILD_FOLDER)