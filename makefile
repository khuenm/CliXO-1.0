CC = /usr/bin/g++
CFLAGS17 = -Wall -O3 -c -std=c++17 -fomit-frame-pointer -funroll-loops -fforce-addr -I .
LFLAGS17 = -Wall -O3 -std=c++17 -fomit-frame-pointer -funroll-loops -fforce-addr -I .
# LIBS = -L$(LIB) -lstdc++fs -l:libboost_serialization.so.1.61.0 -l:libboost_system.so.1.61.0 -Wl,-rpath=$(LIB)
# LIB = ${CURDIR}/boost/lib/
BUILD_DIR = build
OBJS = $(BUILD_DIR)/clixo.o

all: checkdirs $(BUILD_DIR)/clixo $(BUILD_DIR)/clustersToDAG

checkdirs: $(BUILD_DIR)

$(BUILD_DIR):
	@mkdir -p $@

$(BUILD_DIR)/clixo: $(OBJS)
	$(CC) $^ -o $@ $(LFLAGS17)

$(BUILD_DIR)/clixo.o: clixo.cpp util.h dag.h graph_undirected.h dagConstruct.h graph_undirected_bitset.h nodeDistanceObject.h
	$(CC) $< -o $@ $(CFLAGS17)

$(BUILD_DIR)/clustersToDAG: $(BUILD_DIR)/clustersToDAG.o
	$(CC) $^ -o $@ $(LFLAGS17)

$(BUILD_DIR)/clustersToDAG.o: clustersToDAG.cpp util.h dag.h graph_undirected.h dagConstruct.h graph_undirected_bitset.h nodeDistanceObject.h
	$(CC) $< -o $@ $(CFLAGS17)

clean:
	@rm -rf $(BUILD_DIR)
