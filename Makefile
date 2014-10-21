CXXFLAGS += -F $(HOME)/Development/myo-sdk -framework myo
CXXFLAGS += -framework JavaVM

all: libmyo.jnilib myo_user.class

libmyo.jnilib: myo.cpp
	$(LINK.cc) -rpath @loader_path -dynamiclib -o $@ $<

%.class: %.java
	javac $<

test:
	java -Djava.library.path=$(shell pwd) myo_user

clean:
	rm -f libmyo.jnilib myo_user.class
