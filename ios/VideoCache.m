#import "RNVideoCache.h"
#import <KTVHTTPCache/KTVHTTPCache.h>

@implementation RNVideoCache

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(convertToProxyURL:(NSString *)url
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  if (!KTVHTTPCache.proxyIsRunning) {
    NSError *error;
    [KTVHTTPCache proxyStart:&error];
    if (error) {
      reject(@"init.error", @"failed to start proxy server", error);
      return;
    }
  }
  resolve([KTVHTTPCache proxyURLWithOriginalURL:[NSURL URLWithString:url]].absoluteString);
}

RCT_EXPORT_METHOD(cacheRequestURL:(NSString *)url
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    KTVHCDataLoader *_dataLoader = [KTVHTTPCache cacheLoaderWithRequest:[[KTVHCDataRequest alloc] initWithURL:[NSURL URLWithString:url] headers:nil]];
    
    [_dataLoader prepare];
}

RCT_EXPORT_METHOD(checkExistedURL:(NSString *)url
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    resolve([KTVHTTPCache cacheCompleteFileURLWithURL:[NSURL URLWithString:url]].absoluteString);
}

RCT_EXPORT_METHOD(cacheSetMaxLength:(long long)num
                  callback: (RCTResponseSenderBlock)callback)
{

   
}

@end
