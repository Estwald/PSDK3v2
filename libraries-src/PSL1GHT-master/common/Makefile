#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------

all:
	@$(MAKE) -C libsimdmath --no-print-directory
	@$(MAKE) -C vectormath --no-print-directory

install:
	@$(MAKE) -C libsimdmath install --no-print-directory
	@$(MAKE) -C vectormath install --no-print-directory

clean:
	@$(MAKE) -C libsimdmath clean --no-print-directory
	@$(MAKE) -C vectormath clean --no-print-directory

.PHONY: all clean install
