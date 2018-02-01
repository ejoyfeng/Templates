GXX=g++
GCC=gcc
CXXFLAG=-fopenmp -march=core2 -O3 -fomit-frame-pointer -pipe -fPIC
#CXXFLAG=-fopenmp -march=core2 -g -fomit-frame-pointer -pipe -fPIC
CFLAG=$(CXXFLAG)
DIR_INC=./include
DIR_SRC=./src
DIR_OBJ=./obj
DIR_BIN=./bin
DIR_LIB=
LDFLAG=-Wl,--rpath=$(DIR_LIB)/lib,-O3 -fopenmp
SOFLAG=-fPIC -shared 
INCLUDE=-I$(DIR_INC) -I $(DIR_LIB)/include -Ilib/include 

LIBS=-L$(DIR_LIB)/lib -Llib -L/usr/local/lib 
TARGET=$(DIR_BIN)/cmd
DEF= -DLINUX #-DDEBUG #-DPATH  
SRC=$(wildcard ${DIR_SRC}/*.cpp)
OBJS=$(SRC:$(DIR_SRC)/%.cpp=$(DIR_OBJ)/%.o)
LIBOBJ=$(DIR_OBJ)/xxxx.o 
SOLIB=lib/libxxxx.so

all:$(SOLIB) $(TARGET)

$(SOLIB):$(OBJS)
		$(GXX) $(CXXFLAG) $(SOFLAG) -o $@ $(OBJS) $(LIBS) 

$(TARGET):$(OBJS) 
		$(GXX) $(GXXFLAG)$(LDFLAG) -o $@ $(OBJS) $(LIBS)

$(DIR_OBJ)/%.o:$(DIR_SRC)/%.cpp
		$(GXX) -o $@ -c $< $(CXXFLAG) $(INCLUDE) $(DEF)
clean:
		rm -fr $(OBJS) $(TARGET) $(LIBOBJ) $(SOLIB);
