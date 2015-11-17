//=============================================================================
// Copyright (c) 2014 Nicolas Froment

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//=============================================================================

#import "iosshareutils.h"
#import <UIKit/UIKit.h>
#import <QGuiApplication>
#import <QQuickWindow>

IosShareUtils::IosShareUtils(QQuickItem *parent) : PlatformShareUtils(parent)
{

}

void IosShareUtils::share(const QString &text, const QUrl &url) {

      NSMutableArray *sharingItems = [NSMutableArray new];

      if (!text.isEmpty()) {
          [sharingItems addObject:text.toNSString()];
      }
      if (url.isValid()) {
          [sharingItems addObject:url.toNSURL()];
      }

      // get the main window rootViewController
      UIViewController *qtController = [[UIApplication sharedApplication].keyWindow rootViewController];

      UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
      if ( [activityController respondsToSelector:@selector(popoverPresentationController)] ) { // iOS8
            activityController.popoverPresentationController.sourceView = qtController.view;
      }
      [qtController presentViewController:activityController animated:YES completion:nil];
}


