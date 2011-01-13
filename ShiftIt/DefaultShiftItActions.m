/*
 ShiftIt: Resize windows with Hotkeys
 Copyright (C) 2010  Filip Krikava
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 */
#import <Carbon/Carbon.h>

#import "DefaultShiftItActions.h"
#import "FMTDefines.h"

extern short GetMBarHeight(void);

NSInteger const kSIHorizontalSegments = 12;
NSInteger const kSIVerticalSegments = 8;

NSRect ShiftIt_Left(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height;
	
	return r;
}

NSRect ShiftIt_Right(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = screenSize.width/2;
	r.origin.y = 0;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height;

	return r;
}

NSRect ShiftIt_Top(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_Bottom(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = screenSize.height / 2;
	
	r.size.width = screenSize.width;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_TopLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_TopRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = screenSize.width / 2;
	r.origin.y = 0;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_BottomLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = screenSize.height / 2;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_BottomRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = screenSize.width / 2;
	r.origin.y = screenSize.height / 2;
	
	r.size.width = screenSize.width / 2;
	r.size.height = screenSize.height / 2;
	
	return r;
}

NSRect ShiftIt_FullScreen(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width;
	r.size.height = screenSize.height;
	
	return r;
}

NSRect ShiftIt_Center(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = (screenSize.width / 2)-(windowRect.size.width / 2);
	r.origin.y = (screenSize.height / 2)-(windowRect.size.height / 2);	
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_JumpLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat w = screenSize.width / kSIHorizontalSegments;
	
	r.origin.x = (roundf(windowRect.origin.x / w) - 1) * w;
	r.origin.y = windowRect.origin.y - GetMBarHeight();
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_JumpRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat w = screenSize.width / kSIHorizontalSegments;
	
	r.origin.x = (roundf(windowRect.origin.x / w) + 1) * w;
	r.origin.y = windowRect.origin.y - GetMBarHeight();
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_SizeLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat w = screenSize.width / kSIHorizontalSegments;
	
	r.origin = windowRect.origin;
  r.origin.y -= GetMBarHeight();
	
	r.size.width = (roundf(windowRect.size.width / w) - 1) * w;
	r.size.height = windowRect.size.height;
	
	return r;
}

NSRect ShiftIt_SizeRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat w = screenSize.width / kSIHorizontalSegments;
	
	r.origin = windowRect.origin;
  r.origin.y -= GetMBarHeight();
	
	r.size.width = (roundf(windowRect.size.width / w) + 1) * w;
	r.size.height = windowRect.size.height;
	
	return r;
}

NSRect ShiftIt_JumpUp(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat h = screenSize.height / kSIVerticalSegments;
	
	r.origin.x = windowRect.origin.x;
	r.origin.y = (roundf(windowRect.origin.y / h) - 1) * h;
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_JumpDown(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat h = screenSize.height / kSIVerticalSegments;
	
	r.origin.x = windowRect.origin.x;
	r.origin.y = (roundf(windowRect.origin.y / h) + 1) * h;
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_SizeUp(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat h = screenSize.height / kSIVerticalSegments;

	r.origin = windowRect.origin;
  r.origin.y -= GetMBarHeight();
	
	r.size.width = windowRect.size.width;
	r.size.height = (roundf(windowRect.size.height / h) - 1) * h;
	
	return r;
}

NSRect ShiftIt_SizeDown(NSSize screenSize, NSRect windowRect) {
	NSRect r;
  
  CGFloat h = screenSize.height / kSIVerticalSegments;
  
	r.origin = windowRect.origin;
  r.origin.y -= GetMBarHeight();
	
	r.size.width = windowRect.size.width;
	r.size.height = (roundf(windowRect.size.height / h) + 1) * h;
	
	return r;
}
