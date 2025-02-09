resume
======

Python resume generator. From YAML to PDF and static HTML.

Example Themes
--------------
* [simple](http://resume.hanula.com/)
* [compact](http://jmbeach.github.io/resume/)

Installing
----------

    git clone https://github.com/hanula/resume
    cd resume
    pip install -r requirements.txt

### Requirements

This script requires `Python 3` and a set of libraries with their dependencies:

    PyYAML
    Jinja2
    Markdown
    WeasyPrint
    docopt

Usage
-----

1. Look at resume examples in the `resumes` folder and create your own.
2. Copy `config.make.example` to `config.make` and update it with your settings.
3. Run `make` to build HTML and PDF files that will go to the `build` directory.


### PDF generator

PDF is automatically generated along with html when running `make`.
To just create PDF file:

    make pdf

PDF file name in `build` directory is defined by `pdf_file` property in the `config` section of your resume `yaml` file.

### Use a custom PDF
If you prefer to use a custom PDF instead of generating one, you can do so by placing your custom PDF file in the location specified by the `PDF_FILE_LOCATION` variable in your `config.make` file. Ensure that the file name matches the `PDF_FILE` property defined in the `config.make` file. To just copy the custom PDF, run:

    make copypdf

### Publishing

#### Publish via SSH

To publish HTML on your server via SSH, edit `RSYNC_LOCATION` in `config.make` and run:

    make publish

#### Publish to AWS S3

To publish to AWS S3, configure your S3 bucket name in `config.make`, then run:

    make publishs3

Customizing
-------------
There are several customization options available in this project, including the theme and build configuration.

### Adding Your Own Theme
This repo contains a simple and a compact theme.

Add your own theme by creating a `themes/<your-theme>` folder with an `index.jinja2` template file. Every other (non-jinja2) file from the theme directory will be copied to the final `build/` destination.

You can control which theme is used by setting the `theme` property in the resume's `config` section.

### Custom Build Configuration

You can customize the build configuration by editing the `Makefile` file. To use a custom build configuration, you can run:

    make custom

License
-------
[MIT License](https://github.com/hanula/resume/blob/master/LICENSE)
