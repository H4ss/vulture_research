CC=gcc
CFLAGS=-Ilib
DEPS = lib/scanner.h
OBJ = main.o lib/scanner.o
TARGET = vulture_project

# Rule to make the target
$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

# Generic rule for building object files
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

# Clean rule for removing object files and the executable
clean:
	rm -f $(OBJ) $(TARGET)

# Re rule for rebuilding the project
re: clean $(TARGET)

.PHONY: clean re
