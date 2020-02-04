BINARY:=yacp

all: clean build

.PHONY: clean
clean:
	@echo -e "\n> Cleaning build files..."
	rm -rf build/
	rm -f ${BINARY}
	@echo "> Done."

.PHONY: build
build:
	@echo -e "\n> Starting build..."
	@echo "> Making directories..."
	mkdir -p build
	@echo -e "> Done."
	@echo -e "\n> Building lex output for ${BINARY}..."	
	lex -o build/${BINARY}.yy.cc src/yacp.l
	@echo -e "> Done."
	@echo -e "\n> Compiling ${BINARY}..."
	g++ -Iinclude -o build/${BINARY} build/${BINARY}.yy.cc
	@echo -e "> Done."
	@echo -e "\n> Linking ${BINARY}..."
	ln -sf build/${BINARY} .
	@echo -e "> Done."

.PHONY: install
install: build
	@echo -e "\n> Installing ${BINARY}..."
	@echo -e "> Install Complete."

.PHONY: uninstall
uninstall:
	@echo -e "\n> Uninstalling ${BINARY}..."
	@echo -e "> Done." 