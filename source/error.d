module yslc.error;

import std.stdio;
import core.stdc.stdlib;

void ErrorBegin(string fname, size_t line) {
	version (Windows) {
		stderr.writef("%s:%d: error: ", fname, line + 1);
	}
	else {
		stderr.writef("\x1b[1m%s:%d: \x1b[31merror:\x1b[0m ", fname, line + 1);
	}
}
void ErrorUnknownEscape(string fname, size_t line, char ch) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown escape sequence \\%c", ch);
}

void ErrorNoSuchFile(string fname, size_t line, string file) {
	ErrorBegin(fname, line);
	stderr.writefln("No such file exists: '%s'", file);
}

void ErrorUnknownDirective(string fname, size_t line, string directive) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown directive: '%s'", directive);
}

void ErrorUnknownVariable(string fname, size_t line, string name) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown variable: '%s'", name);
}

void ErrorUnknownFunction(string fname, size_t line, string name) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown function: '%s'", name);
}

void ErrorWrongParameterNum(string fname, size_t line, size_t expected, size_t got) {
	ErrorBegin(fname, line);
	stderr.writefln("Wrong amount of parameters, expected %d, got %d", expected, got);
}

void ErrorUnknownType(string fname, size_t line, string name) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown type: '%s'", name);
}

void ErrorEmptyStatement(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writeln("Empty statement");
}

void ErrorExpectedInteger(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writefln("Expected integer");
}

void ErrorForWontRun(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writefln("This for loop won't run");
}

void ErrorUnknownOperator(string fname, size_t line, char operator) {
	ErrorBegin(fname, line);
	stderr.writefln("Unknown operator '%c'", operator);
}

void ErrorAlreadyElse(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writeln("An else was already made in this statement");
}

void ErrorNoIfToMatch(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writeln("No if to match this endif");
}

void ErrorInvalidHex(string fname, size_t line) {
	ErrorBegin(fname, line);
	stderr.writeln("Invalid hex");
}
