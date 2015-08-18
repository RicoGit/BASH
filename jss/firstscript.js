#!/usr/bin/jjs -scripting

// or
// jjs -scripting firstscript.js for running

/*

load("nashorn:mozilla_compat.js");

importClass(java.util.HashSet);
var set = new HashSet();

importPackage(java.util);
var list = new ArrayList(); 


better

var CollectionsAndFiles = new JavaImporter(
    java.util,
    java.io,
    java.nio);

with (CollectionsAndFiles) {
  var files = new LinkedHashSet();
  files.add(new File("Plop"));
  files.add(new File("Foo"));
  files.add(new File("w00t.js"));
} 

types

var LinkedList = Java.type("java.util.LinkedList");
var primitiveInt = Java.type("int");
var arrayOfInts = Java.type("int[]"); 

Impl interfaces

var iterator = new java.util.Iterator({
  i: 0,
  hasNext: function() {
    return this.i < 10;
  },
  next: function() {
    return this.i++;
  }
});

Impl of function interfaces

var odd = list.stream().filter(
  function(i) {
  return i % 2 == 0;
}); 



*/

var ArrayList = Java.type("java.util.ArrayList");
var Integer = Java.type("java.lang.Integer");
arrayList = new ArrayList();

arrayList.add(1);
arrayList.add(2);
arrayList.add(3);

var max = arrayList
	.stream()
	.min(function(p1, p2) {
		return Integer.compare(p1, p2)
	})

print(max.orElse(-1))
print("test")

 /*
shell global objects
	$ARG
	$ENV
	$EXEC('ls -la') or `ls -la`
	$OUT - stdout
	$ERR - stderr
	$EXIT
Shell build-in functions
	quit(), exit()

	print(), echo()
	readLine() - read one line in stdin
	readFully()
	load() - load js lib
	loadWithNewGlobal() - 
	Object.bindProperties()
 */