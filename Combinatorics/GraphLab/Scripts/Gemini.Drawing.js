/**
* Gemini Library v1.0.0
* http://www.jooyandeh.com/
* Copyright 2012, Mohammadreza Jooyandeh
*
* Copyright (C) 2011 - 2013 by Mohammadreza Jooyandeh
*
* All rights reserved. Permission is hereby given for use and/or distribution
* with the exception of sale for profit or application with non military
* significance. You must not remove this copyright notice, and you must
* document any changes that you make to this program. This software is subject
* to this copyright only, irrespective of any copyright attached to any package
* of which this is a part. Absolutely no guarantees or warranties are made
* concerning the suitability, correctness, or any other aspect of this program.
* Any use is at your own risk.
*/

if (typeof (Gemini) == "undefined")
	Gemini = {};
if (typeof (Gemini.Drawing) == "undefined")
	Gemini.Drawing = {};

Gemini.Drawing.Point = function (x, y) {
	this.x = x;
	this.y = y;
}

Gemini.Drawing.Vector = function (x, y) {
	this.x = x;
	this.y = y;
}
	
Gemini.Drawing.Size = function (width, height) {
	this.width = width;
	this.height = height;
}

Gemini.Drawing.Rect = function (left, top, width, height) {
	this.left = left;
	this.top = top;
	this.width = width;
	this.height = height;
}

Gemini.Drawing.Padding = function (left, top, right, bottom) {
	this.left = left;
	this.top = top;
	this.right = right;
	this.bottom = bottom;
}
