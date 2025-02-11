# Include config if exists
-include  config.make

# Put these into config.make to override with your setup
RESUME ?= resumes/example.yaml
RSYNC_LOCATION ?= example.com:/var/www/resume/
S3_BUCKET ?= example.com
PDF_FILE ?= resume.pdf
PDF_FILE_LOCATION ?= .

PYTHON ?= $(shell which python3)
RSYNC ?= $(shell which rsync)
RSYNC_ARGS ?= aAXv
BUILD_DIR ?= build
BUILD_ARGS ?= --output_dir $(BUILD_DIR)
BUILD ?= $(PYTHON) build.py $(BUILD_ARGS)

# Build configurations
all: clean html pdf
build: clean html
publish: clean html pdf publish
custom: clean html copypdf publishs3

html:
	$(BUILD) --format html $(RESUME)
	@echo "Done"

copypdf:
	cp $(PDF_FILE_LOCATION)/$(PDF_FILE) $(BUILD_DIR)/
	@echo "Done"

pdf:
	$(BUILD) --format pdf $(RESUME)
	@echo "Done"

clean:
	@rm -rf ./build

publish:
	$(RSYNC) -$(RSYNC_ARGS) $(BUILD_DIR) $(RSYNC_LOCATION)
	@echo "Done"

publishs3:
	aws s3 sync $(BUILD_DIR) s3://$(S3_BUCKET)/ --delete
	@echo "Done"