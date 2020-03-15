RELEASE_FOLDER=./dist
BUILD_FOLDER=./build
INSTALL_FOLDER=../Plugins

SD_DICE=com.viddie.dice.sdPlugin
SD_DICE_PLUGIN=com.viddie.dice.streamDeckPlugin


install_sdDice: build_sdDice
	cp $(BUILD_FOLDER)/$(SD_DICE) $(INSTALL_FOLDER)/$(SD_DICE)
	
build_sdDice: clean_sdDice
	mkdir -p $(RELEASE_FOLDER)
	mkdir -p $(BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)/$(SD_DICE)
	cp $(SD_DICE)/manifest.json $(BUILD_FOLDER)/$(SD_DICE)/manifest.json
	cp $(SD_DICE)/index.html $(BUILD_FOLDER)/$(SD_DICE)/index.html
	cp -r $(SD_DICE)/js $(BUILD_FOLDER)/$(SD_DICE)/
	cp -r $(SD_DICE)/propertyinspector $(BUILD_FOLDER)/$(SD_DICE)/
	cp -r $(SD_DICE)/images $(BUILD_FOLDER)/$(SD_DICE)/
	DistributionTool -b -i $(BUILD_FOLDER)/$(SD_DICE) -o $(RELEASE_FOLDER)
	
clean_sdDice:
	rm -rf $(BUILD_FOLDER)/$(SD_DICE) $(RELEASE_FOLDER)/$(SD_DICE_PLUGIN)
	
	
	
clean: clean_sdDice
	rm -rf $(RELEASE_FOLDER) $(BUILD_FOLDER)