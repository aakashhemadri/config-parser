BINARY:=yacp

all: uninstall install clean

.PHONY: clean
clean:
	@echo "Cleaning build files..."
	@rm -rf build/
	@rm -f yacp
	@echo "Done."

.PHONY: build
build:
	@echo "Making directories..."
	@mkdir -p build
	@echo "Building lex output..."	
	@lex -o build/yacp.yy.cc src/yacp.l
	@echo "Compiling program..."
	@g++ -Iinclude -o build/yacp build/yacp.yy.cc
	@ln -s build/yacp .
	@echo "Linked binary."

.PHONY: install
install: build
	@echo "Installing..."
	@echo "Done."

.PHONY: uninstall
uninstall:
	@echo "Uninstalling..."
	@echo "Done." 